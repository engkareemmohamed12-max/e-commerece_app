import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:e_commerece_app/domain/entities/response/product/product.dart';
import 'package:e_commerece_app/domain/repositories/brand/brand_repository.dart';
import 'package:e_commerece_app/domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final ProductRepository _productRepository ;
  GetAllProductsUseCase(this._productRepository);

 Future<List<Product>?> invoke(){
    return _productRepository.getProducts();
  }
}