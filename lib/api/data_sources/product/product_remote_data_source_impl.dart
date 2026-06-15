// todo : impl

import 'package:dio/dio.dart';
import 'package:e_commerece_app/api/api_services.dart';
import 'package:e_commerece_app/api/mapper/home/category_or_brand_response_mapper.dart';
import 'package:e_commerece_app/api/mapper/product/product_mapper.dart';
import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerece_app/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:e_commerece_app/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices _apiServices;
  ProductRemoteDataSourceImpl(this._apiServices);





  @override
  Future<List<Product>?> getProducts() async{
    try {
      var productResponse = await _apiServices.getAllProducts();
      // todo : List<ProductDto> => List<Product>
      return productResponse.data?.map((prodDto)=> prodDto.toProduct()).toList();
    } on DioException catch (e) {
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}