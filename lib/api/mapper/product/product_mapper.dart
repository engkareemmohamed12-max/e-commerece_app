import 'package:e_commerece_app/api/mapper/home/category_or_brand_mapper.dart';
import 'package:e_commerece_app/api/mapper/product/sub_category_mapper.dart';
import 'package:e_commerece_app/api/models/response/products/product_dto.dart';
import 'package:e_commerece_app/domain/entities/response/product/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct(){
    return Product(
      id: id,
      title: title,
      category: category?.toCategoryOrBrand(),
      description: description,
      price: price ,
      slug: slug,
      // todo : List<SubCategoryDto> => List<SubCategory>
      subcategory: subcategory?.map((subDto) => subDto.toSubCategory()).toList()??[],
      sold: sold,
      ratingsQuantity: ratingsQuantity,
      ratingsAverage: ratingsAverage,
      quantity: quantity,
      images: images,
      imageCover: imageCover,
      // todo : List<CategoryOrBrandDto> => List<CategoryOrBrand>
      brand: brand?.toCategoryOrBrand()

    );
  }
}