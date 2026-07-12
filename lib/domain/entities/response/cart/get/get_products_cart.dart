
import 'package:e_commerece_app/domain/entities/response/product/product.dart';

class GetProductsCart {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  GetProductsCart ({
    this.count,
    this.id,
    this.product,
    this.price,
  });

}