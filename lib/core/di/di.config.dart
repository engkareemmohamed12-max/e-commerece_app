// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_sources/auth/auth_remote_data_source_impl.dart' as _i34;
import '../../api/data_sources/brand/brands_remote_data_source_impl.dart'
    as _i340;
import '../../api/data_sources/category/category_remote_data_source_impl.dart'
    as _i494;
import '../../api/data_sources/product/product_remote_data_source_impl.dart'
    as _i392;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../data/data_sources/remote/auth/auth_remote_data_source.dart'
    as _i202;
import '../../data/data_sources/remote/brand/brand_remote_data_source.dart'
    as _i167;
import '../../data/data_sources/remote/category/category_remote_data_source.dart'
    as _i89;
import '../../data/data_sources/remote/product/product_remote_data_source.dart'
    as _i1038;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/brand/brand_repository_impl.dart' as _i155;
import '../../data/repositories/category/category_repository_impl.dart'
    as _i702;
import '../../data/repositories/product/product_repository_impl.dart' as _i322;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/brand/brand_repository.dart' as _i825;
import '../../domain/repositories/category/category_repository.dart' as _i612;
import '../../domain/repositories/product/product_repository.dart' as _i774;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/get_all_products_use_case.dart' as _i939;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/pages/home_screen/cubit/home_screen_view_model.dart'
    as _i114;
import '../../features/ui/pages/home_screen/tabs/home_screen_tab/cubit/home_tab_view_model.dart'
    as _i514;
import '../../features/ui/pages/home_screen/tabs/product_tab/cubit/product_view_model.dart'
    as _i307;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i114.HomeScreenViewModel>(() => _i114.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions);
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger,
    );
    gh.singleton<_i394.ApiServices>(() => getItModule.provideApiServices);
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i167.BrandRemoteDataSource>(
      () => _i340.BrandsRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i89.CategoryRemoteDataSource>(
      () => _i494.CategoryRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i202.AuthRemoteDataSource>(
      () => _i34.AuthRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i825.BrandRepository>(
      () => _i155.BrandRepositoryImpl(gh<_i167.BrandRemoteDataSource>()),
    );
    gh.factory<_i1038.ProductRemoteDataSource>(
      () => _i392.ProductRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i774.ProductRepository>(
      () => _i322.ProductRepositoryImpl(gh<_i1038.ProductRemoteDataSource>()),
    );
    gh.factory<_i660.AuthRepository>(
      () => _i24.AuthRepositoryImpl(gh<_i202.AuthRemoteDataSource>()),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () => _i773.GetAllBrandsUseCase(gh<_i825.BrandRepository>()),
    );
    gh.factory<_i612.CategoryRepository>(
      () => _i702.CategoryRepositoryImpl(gh<_i89.CategoryRemoteDataSource>()),
    );
    gh.factory<_i939.GetAllProductsUseCase>(
      () => _i939.GetAllProductsUseCase(gh<_i774.ProductRepository>()),
    );
    gh.factory<_i307.ProductViewModel>(
      () => _i307.ProductViewModel(gh<_i939.GetAllProductsUseCase>()),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(gh<_i660.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(gh<_i660.AuthRepository>()),
    );
    gh.factory<_i201.GetAllCategoriesUseCase>(
      () => _i201.GetAllCategoriesUseCase(gh<_i612.CategoryRepository>()),
    );
    gh.factory<_i514.HomeTabViewModel>(
      () => _i514.HomeTabViewModel(
        gh<_i201.GetAllCategoriesUseCase>(),
        gh<_i773.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i873.RegisterViewModel>(
      () => _i873.RegisterViewModel(gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i245.LoginViewModel>(
      () => _i245.LoginViewModel(gh<_i471.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
