import 'package:e_commerece_app/domain/entities/response/product/product.dart';

abstract class ProductRepository {

  Future<List<Product>?> getProducts();
}