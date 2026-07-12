
import 'package:e_commerece_app/domain/entities/response/cart/add/add_product.dart';

class AddDataCart {
  final String? id;
  final String? cartOwner;
  final List<AddProduct>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  AddDataCart ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });


}