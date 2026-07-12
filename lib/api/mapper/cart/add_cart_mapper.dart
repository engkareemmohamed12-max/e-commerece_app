import 'package:e_commerece_app/api/mapper/cart/add_data_cart_mapper.dart';
import 'package:e_commerece_app/api/models/response/cart/add/add_product_cart_response_dto.dart';
import 'package:e_commerece_app/domain/entities/response/cart/add/add_product_cart_response.dart';

extension  AddCartMapper on AddProductCartResponseDto{
  AddProductCartResponse toAddProductCartResponse(){
    return AddProductCartResponse(
      // todo : addDataCartDto => addDataCart
      data: data?.toAddDataCart(),
      message: message,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}