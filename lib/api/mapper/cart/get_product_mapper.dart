import 'package:e_commerece_app/api/mapper/product/product_mapper.dart';
import 'package:e_commerece_app/api/models/response/cart/get/get_products_cart_dto.dart';
import 'package:e_commerece_app/domain/entities/response/cart/get/get_products_cart.dart';

extension GetProductMapper on GetProductsCartDto{
  GetProductsCart toGetProductsCart(){
    return GetProductsCart(
      id: id,
      product: product?.toProduct(),
      count: count,
      price: price
    );
  }
}