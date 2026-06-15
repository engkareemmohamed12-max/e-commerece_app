import 'package:e_commerece_app/domain/entities/response/common/category_or_brand.dart';

sealed class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates{}

class CategoryLoadingState extends HomeTabStates{}



class CategoryErrorState extends HomeTabStates{
  String errorMessage ;
  CategoryErrorState(this.errorMessage);
}


class BrandLoadingState extends HomeTabStates{}



class BrandErrorState extends HomeTabStates{
  String errorMessage ;
  BrandErrorState(this.errorMessage);
}


class HomeTabSuccessState extends HomeTabStates {

  List<CategoryOrBrand>? categoryList ;
  List<CategoryOrBrand>? brandsList ;

  HomeTabSuccessState({ this.categoryList ,  this.brandsList});

  HomeTabSuccessState copyWith(
  {List<CategoryOrBrand>? categoryList ,
  List<CategoryOrBrand>? brandsList
  }
      ){

    return HomeTabSuccessState(
        categoryList: categoryList ?? this.categoryList,
        brandsList: brandsList ?? this.brandsList
    );
  }


}

