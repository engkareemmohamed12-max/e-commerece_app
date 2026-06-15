import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerece_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerece_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/home_screen_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {

  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllBrandsUseCase _getAllBrandsUseCase ;

  HomeTabViewModel(this._getAllCategoriesUseCase , this._getAllBrandsUseCase):super(HomeTabInitialState());

  //todo : hold data - handle logic

  List<CategoryOrBrand>? categoriesList ;

  HomeTabSuccessState successState = HomeTabSuccessState();

Future<void> getAllCategories () async{
  try{

    emit(CategoryLoadingState());
    var categoryResponse = await _getAllCategoriesUseCase.invoke();
   emit(successState = successState.copyWith(categoryList: categoryResponse.data));

  }on AppExceptions catch(e){

    emit(CategoryErrorState(e.message));
    
  }catch(e){

    emit(CategoryErrorState(e.toString()));

  }
}


  Future<void> getAllBrands () async{
    try{

      emit(BrandLoadingState());
      var brandsResponse = await _getAllBrandsUseCase.invoke();
      emit(successState = successState.copyWith(brandsList: brandsResponse.data));

    }on AppExceptions catch(e){

      emit(BrandErrorState(e.message));

    }catch(e){

      emit(BrandErrorState(e.toString()));

    }
  }

}