import 'package:e_commerece_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:e_commerece_app/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {

  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl(this._categoryRemoteDataSource);

  @override
  Future<CategoryOrBrandResponse> getCategories() {
    return _categoryRemoteDataSource.getCategories();
  }

}