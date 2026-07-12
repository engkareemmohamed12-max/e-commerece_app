
import 'package:e_commerece_app/domain/entities/response/cart/get/get_data_cart.dart';

class GetCartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetDataCart? data;

  GetCartResponse ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });


}








