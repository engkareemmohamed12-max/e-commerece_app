import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:e_commerece_app/domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  final BrandRepository _brandRepository ;
  GetAllBrandsUseCase(this._brandRepository);

 Future<CategoryOrBrandResponse> invoke(){
    return _brandRepository.getBrands();
  }
}