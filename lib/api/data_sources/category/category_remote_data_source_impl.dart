// todo : impl

import 'package:dio/dio.dart';
import 'package:e_commerece_app/api/api_services.dart';
import 'package:e_commerece_app/api/mapper/home/category_or_brand_response_mapper.dart';
import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiServices _apiServices;
  CategoryRemoteDataSourceImpl(this._apiServices);



  @override
  Future<CategoryOrBrandResponse> getCategories() async {
    try {
      var categoryResponse = await _apiServices.getAllCategories();
      return categoryResponse.toCategoryOrBrandResponse();
    } on DioException catch (e) {
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}