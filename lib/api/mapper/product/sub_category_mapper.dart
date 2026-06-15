import 'package:e_commerece_app/api/models/response/products/sub_category_dto.dart';
import 'package:e_commerece_app/domain/entities/response/product/sub_category.dart';

extension SubCategoryMapper on SubcategoryDto{
  Subcategory toSubCategory(){
    return Subcategory(
      slug: slug,
      category: category,
      id: id,
      name: name,
    );
  }
}