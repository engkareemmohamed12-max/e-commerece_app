import 'package:e_commerece_app/api/mapper/cart/get_data_cart_mapper.dart';
import 'package:e_commerece_app/api/models/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerece_app/domain/entities/response/cart/get/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      // todo : GetDataCartDto => GetDataCart
      data: data?.toGetDataCart()
    );
  }
}