import 'package:e_commerece_app/api/models/response/category_brand/common/category_or_brand_dto.dart';
import 'package:e_commerece_app/domain/entities/response/common/category_or_brand.dart';

extension CategoryOrBrandMapper on CategoryOrBrandDto{
  CategoryOrBrand toCategoryOrBrand(){
    return CategoryOrBrand(
      name: name ,
      id: id,
      image: image
    );
  }
}