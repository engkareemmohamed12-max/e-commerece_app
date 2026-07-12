import 'package:e_commerece_app/domain/entities/response/cart/get/get_cart_response.dart';

sealed class CartStates {}

class CartInitialState extends CartStates{}

class AddCartLoadingState extends CartStates{}

class AddCartErrorState extends CartStates{
  String errorMessage;
  AddCartErrorState({required this.errorMessage});

}

class AddCartSuccessState extends CartStates{
  int numOfCartItems;
  AddCartSuccessState({required this.numOfCartItems});



}


class GetCartLoadingState extends CartStates{}

class GetCartErrorState extends CartStates{
  String errorMessage;
  GetCartErrorState({required this.errorMessage});

}

class GetCartSuccessState extends CartStates{
  GetCartResponse cartResponse;
  GetCartSuccessState({required this.cartResponse});



}
