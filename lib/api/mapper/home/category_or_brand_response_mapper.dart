import 'package:e_commerece_app/api/mapper/home/category_or_brand_mapper.dart';
import 'package:e_commerece_app/api/mapper/home/metadata_mapper.dart';
import 'package:e_commerece_app/api/models/response/category_brand/category_or_brand_response_dto.dart';
import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';

extension CategoryOrBrandResponseMapper on CategoryOrBrandResponseDto{
  CategoryOrBrandResponse toCategoryOrBrandResponse(){
    return CategoryOrBrandResponse(
      // todo : List<CategoryOrBrandDto> => List<CategoryOrBrand>
      data: data?.map((catDto)=> catDto.toCategoryOrBrand()).toList() ?? [],
      metadata: metadata?.toMetaData(),
      results: results

    );
  }
}