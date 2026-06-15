import '../../entities/response/category_brand/category_or_brand_response.dart';

abstract class BrandRepository {

  Future<CategoryOrBrandResponse> getBrands();

}