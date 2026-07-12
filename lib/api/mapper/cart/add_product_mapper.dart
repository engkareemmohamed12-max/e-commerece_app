import 'package:e_commerece_app/api/models/response/cart/add/add_product_dto.dart';
import 'package:e_commerece_app/domain/entities/response/cart/add/add_product.dart';

extension AddProductMapper on AddProductDto{
  AddProduct toAddProduct(){
    return AddProduct(
      id: id,
      price: price,
      count: count,
      product: product
    );
  }
}