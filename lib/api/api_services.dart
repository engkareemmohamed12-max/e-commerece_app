import 'package:dio/dio.dart';
import 'package:e_commerece_app/api/end_point.dart';
import 'package:e_commerece_app/api/models/request/cart/add/add_product_request_dto.dart';
import 'package:e_commerece_app/api/models/response/cart/add/add_product_cart_response_dto.dart';
import 'package:e_commerece_app/api/models/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerece_app/api/models/response/category_brand/category_or_brand_response_dto.dart';
import 'package:e_commerece_app/api/models/response/products/product_response_dto.dart';

import 'package:retrofit/retrofit.dart';

import 'models/request/auth/login/login_request_dto.dart';
import 'models/request/auth/register/register_request_dto.dart';
import 'models/response/auth/auth_response_dto.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoint.loginAPi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoint.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);

  
  @GET(EndPoint.categoriesApi)
  Future<CategoryOrBrandResponseDto> getAllCategories();

  @GET(EndPoint.brandsApi)
  Future<CategoryOrBrandResponseDto> getAllBrands();

  @GET(EndPoint.productsApi)
  Future<ProductResponseDto> getAllProducts();
  
  
  @POST(EndPoint.cartApi)
  Future<AddProductCartResponseDto> addProductToCart(
      @Body() AddProductRequestDto addProductRequest ,
      @Header('token') String token
      );

  @GET(EndPoint.cartApi)
  Future<GetCartResponseDto> getItemsInCart(
      @Header('token') String token
      );

}