import 'package:e_commerece_app/api/mapper/cart/get_product_mapper.dart';
import 'package:e_commerece_app/api/models/response/cart/get/get_data_cart_dto.dart';
import 'package:e_commerece_app/domain/entities/response/cart/get/get_data_cart.dart';

extension GetDataCartMapper on GetDataCartDto{
  GetDataCart toGetDataCart(){
    return GetDataCart(
      id: id,
      v: v,
      updatedAt: updatedAt,
      totalCartPrice: totalCartPrice,
      // todo : List<GetProductsCartDto> => List<GetProductsCart>
      products: products?.map((proDto) => proDto.toGetProductsCart()).toList()??[],
      createdAt: createdAt,
      cartOwner: createdAt
    );
  }
}