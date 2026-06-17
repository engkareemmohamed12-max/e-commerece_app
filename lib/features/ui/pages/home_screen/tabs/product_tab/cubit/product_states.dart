import 'package:e_commerece_app/domain/entities/response/product/product.dart';

sealed class ProductStates {}

class ProductInitialState extends ProductStates{}

class ProductLoadingState extends ProductStates{}

class ProductErrorState extends ProductStates{

  String errorMessage;
  ProductErrorState(this.errorMessage);

}


class ProductSuccessState extends ProductStates{

  List<Product> productsList;

  ProductSuccessState({required this.productsList});

}
