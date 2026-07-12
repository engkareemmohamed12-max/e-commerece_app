
import 'add_data_cart.dart';

class AddProductCartResponse {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final AddDataCart? data;

  AddProductCartResponse ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });


}






