import 'package:e_commerece_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/exception/app_exceptions.dart';


@injectable
class ProductViewModel extends Cubit<ProductStates>{

  final GetAllProductsUseCase _getAllProductsUseCase;

  ProductViewModel(this._getAllProductsUseCase):super(ProductLoadingState());

  Future<void> getAllProducts () async{
    try{

      emit(ProductLoadingState());
      var productsList = await _getAllProductsUseCase.invoke();
      emit(ProductSuccessState(productsList: productsList??[]));

    }on AppExceptions catch(e){

      emit(ProductErrorState(e.message));

    }catch(e){

      emit(ProductErrorState(e.toString()));

    }
  }
}