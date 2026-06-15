import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:e_commerece_app/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoryRepository _categoryRepository ;
  GetAllCategoriesUseCase(this._categoryRepository);

 Future<CategoryOrBrandResponse> invoke(){
    return _categoryRepository.getCategories();
  }
}