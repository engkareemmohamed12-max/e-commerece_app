import 'package:dio/dio.dart';
import 'package:e_commerece_app/api/api_services.dart';
import 'package:e_commerece_app/api/mapper/cart/add_cart_mapper.dart';
import 'package:e_commerece_app/api/mapper/cart/get_cart_response_mapper.dart';
import 'package:e_commerece_app/api/models/request/cart/add/add_product_request_dto.dart';
import 'package:e_commerece_app/core/cache/shared_prefs_utils.dart';
import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerece_app/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:CartRemoteDataSource )
class CartRemoteDataSourceImpl implements CartRemoteDataSource{

  final ApiServices _apiServices ;
  
  CartRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AddProductCartResponse> addProductCart(String poductId) async {
    try{

      AddProductRequestDto addProductRequest = AddProductRequestDto(
        productId: poductId
      );

      var token = SharedPrefsUtils.getData(key: 'token');

      var addCartResponse = await _apiServices.addProductToCart(addProductRequest, token.toString());
      return addCartResponse.toAddProductCartResponse() ;

    }on DioException catch(e){
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsInCart() async{
    try{

      var token = SharedPrefsUtils.getData(key: 'token');

      var getItemsCartResponse = await
      _apiServices.getItemsInCart( token.toString());


      // todo : GetCartResponseDto => GetCartResponse
      return getItemsCartResponse.toGetCartResponse() ;

    }on DioException catch(e){
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

}