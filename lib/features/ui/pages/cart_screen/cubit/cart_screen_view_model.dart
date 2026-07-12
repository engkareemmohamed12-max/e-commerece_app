import 'package:e_commerece_app/domain/entities/response/cart/get/get_products_cart.dart';
import 'package:e_commerece_app/domain/use_cases/add_product_cart_use_case.dart';
import 'package:e_commerece_app/domain/use_cases/get_items_cart_use_case.dart';
import 'package:e_commerece_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class CartScreenViewModel extends Cubit<CartStates>{

  final AddProductCartUseCase _addProductCartUseCase;


  final GetItemsCartUseCase _getItemsCartUseCase;

  CartScreenViewModel(this._addProductCartUseCase , this._getItemsCartUseCase):super(CartInitialState());

  int numOfCartItems = 0 ;

  List<GetProductsCart> ? productList ;

  static CartScreenViewModel get(context) => BlocProvider.of<CartScreenViewModel>(context);

  Future<void> addProductCart(String productId) async{
    try{

      emit(AddCartLoadingState());
     var addProductResponse = await _addProductCartUseCase.invoke(productId);

      numOfCartItems = addProductResponse.numOfCartItems ?? 0 ;

     emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
      
    }catch(e){
      emit(AddCartErrorState(errorMessage: e.toString()));
    }
  }


  Future<void> getItemsCart() async{
    try{

      emit(GetCartLoadingState());
      var getItemCartResponse = await _getItemsCartUseCase.invoke();

      numOfCartItems = getItemCartResponse.numOfCartItems ?? 0 ;

      productList = getItemCartResponse.data?.products;

      emit(GetCartSuccessState(cartResponse: getItemCartResponse));

    }catch(e){
      emit(GetCartErrorState(errorMessage: e.toString()));
    }
  }



}