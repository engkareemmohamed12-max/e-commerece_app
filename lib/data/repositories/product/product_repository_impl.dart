import 'package:e_commerece_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerece_app/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/product/product.dart';
import 'package:e_commerece_app/domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {

  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Product>?> getProducts() {
    return _remoteDataSource.getProducts();
  }



}