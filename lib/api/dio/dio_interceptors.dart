import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/exception/app_exceptions.dart';

class DioInterceptors extends Interceptor{
  @override
  void onError(DioException err , ErrorInterceptorHandler handler){
    AppExceptions exception ;

    final responseData = err.response?.data ;
    String message = 'Something Went Wrong';

    if(responseData is Map){
      message =
          responseData['errors']?['msg'] ?? responseData['message'] ?? message ;
    }

    switch (err.type){
      case DioException.connectionTimeout:
      case DioException.sendTimeout:
      case DioException.receiveTimeout:
      case DioException.connectionError:
        exception = NetworkException(message: 'Please check you internet connection');
        break ;


      case DioException.badResponse:
        exception  = ServerException(
            message: message,
            statusCode: err.response?.statusCode,
        );
        break;

      case DioExceptionType.cancel:
        exception  = UnexpectedException(message: 'Request was cancelled');
        break ;

        default:
          exception = UnexpectedException(message: message);
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        response: err.response,
        type: err.type
      )
    );

  }
}