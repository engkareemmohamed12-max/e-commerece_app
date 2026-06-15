import 'package:e_commerece_app/data/data_sources/remote/brand/brand_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:e_commerece_app/domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository {

  final BrandRemoteDataSource _brandRemoteDataSource;

  BrandRepositoryImpl(this._brandRemoteDataSource);

  @override
  Future<CategoryOrBrandResponse> getBrands() {
    return _brandRemoteDataSource.getBrands();
  }

}