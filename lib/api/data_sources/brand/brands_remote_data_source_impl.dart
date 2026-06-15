// todo : impl

import 'package:dio/dio.dart';
import 'package:e_commerece_app/api/api_services.dart';
import 'package:e_commerece_app/api/mapper/home/category_or_brand_response_mapper.dart';
import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/data/data_sources/remote/brand/brand_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandRemoteDataSource {
  final ApiServices _apiServices;
  BrandsRemoteDataSourceImpl(this._apiServices);



  @override
  Future<CategoryOrBrandResponse> getBrands() async{
    try{

      var brandResponse = await _apiServices.getAllBrands();
      return brandResponse.toCategoryOrBrandResponse() ;
    }on DioException catch(e){

      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}