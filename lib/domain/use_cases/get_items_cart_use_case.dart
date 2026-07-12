import 'package:e_commerece_app/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerece_app/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerece_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsCartUseCase {
  final CartRepository _cartRepository ;
  GetItemsCartUseCase(this._cartRepository);

 Future<GetCartResponse> invoke(){
    return _cartRepository.getItemsInCart();
  }
}