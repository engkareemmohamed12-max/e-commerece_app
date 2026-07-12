
import 'package:e_commerece_app/domain/entities/response/cart/get/get_products_cart.dart';

class GetDataCart {
  final String? id;
  final String? cartOwner;
  final List<GetProductsCart>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  GetDataCart ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });


}