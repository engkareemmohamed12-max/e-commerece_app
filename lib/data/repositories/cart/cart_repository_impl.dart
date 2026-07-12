import 'package:e_commerece_app/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerece_app/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerece_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {

  final CartRemoteDataSource _remoteDataSource;

  CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<AddProductCartResponse> addProductCart(String productId) {
    return _remoteDataSource.addProductCart(productId);
  }

  @override
  Future<GetCartResponse> getItemsInCart() {
    return _remoteDataSource.getItemsInCart();
  }

}