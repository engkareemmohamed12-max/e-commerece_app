import 'package:dio/dio.dart';
import 'package:e_commerece_app/api/api_services.dart';
import 'package:e_commerece_app/api/dio/dio_interceptors.dart';
import 'package:e_commerece_app/api/end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {

  @singleton
  BaseOptions get provideBaseOptions => BaseOptions(
    baseUrl: EndPoint.baseUrl,
    sendTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5)
  );

  @singleton
  PrettyDioLogger get providePrettyDioLogger => PrettyDioLogger(
    requestBody: true ,
    requestHeader: true,
    responseHeader: true,
    responseBody: true,
    error: true,
    request: true
  );

  @singleton
  Dio  provideDio(BaseOptions baseOption , PrettyDioLogger prettyDioLogger){

    var dio = Dio(baseOption);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio ;

  }

  @singleton
  ApiServices get provideApiServices =>
      ApiServices(provideDio(provideBaseOptions, providePrettyDioLogger));

}
// todo : ApiServices => object dio
// todo : dio => base options , pretty dio logger , interceptor