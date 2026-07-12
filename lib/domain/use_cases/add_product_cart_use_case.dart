import 'package:e_commerece_app/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerece_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductCartUseCase {
  final CartRepository _cartRepository ;
  AddProductCartUseCase(this._cartRepository);

 Future<AddProductCartResponse> invoke(String productId){
    return _cartRepository.addProductCart(productId);
  }
}