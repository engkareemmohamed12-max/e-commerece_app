import 'package:e_commerece_app/domain/entities/response/product/product.dart';


abstract class ProductRemoteDataSource {

  Future<List<Product>?> getProducts();


}