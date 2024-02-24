// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/home/brands_data_source.dart' as _i4;
import '../../data/data_source/home/categories_data_source.dart' as _i9;
import '../../data/data_source/home/products_data_source.dart' as _i15;
import '../../data/data_source_imp/home/brands_online_data_source_imp.dart'
    as _i5;
import '../../data/data_source_imp/home/categories_online_data_source_imp.dart'
    as _i10;
import '../../data/data_source_imp/home/products_online_data_source_imp.dart'
    as _i16;
import '../../data/repository_imp/home/brands_repository_imp.dart' as _i7;
import '../../data/repository_imp/home/categories_repository_imp.dart' as _i12;
import '../../data/repository_imp/home/products_repository_imp.dart' as _i18;
import '../../domain/repository/home/brands_repository.dart' as _i6;
import '../../domain/repository/home/categories_repository.dart' as _i11;
import '../../domain/repository/home/products_repository.dart' as _i17;
import '../../domain/use_case/brands_use_case.dart' as _i8;
import '../../domain/use_case/categories_use_case.dart' as _i13;
import '../../domain/use_case/products_use_case.dart' as _i19;
import '../../features/home_layout/manager/layout_cubit.dart' as _i14;
import '../../features/home_layout/pages/views/home_view/manager/home_cubit.dart'
    as _i20;
import '../../features/home_layout/pages/views/profile_view/manager/home_cubit.dart'
    as _i21;
import '../web_services/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.BrandsDataSource>(
        () => _i5.OnlineBrandsDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i6.BrandsRepository>(
        () => _i7.BrandsRepositoryImp(gh<_i4.BrandsDataSource>()));
    gh.factory<_i8.BrandsUseCase>(
        () => _i8.BrandsUseCase(gh<_i6.BrandsRepository>()));
    gh.factory<_i9.CategoriesDataSource>(
        () => _i10.CategoriesOnlineDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i11.CategoriesRepository>(
        () => _i12.CategoriesRepositoryImp(gh<_i9.CategoriesDataSource>()));
    gh.factory<_i13.CategoriesUseCase>(
        () => _i13.CategoriesUseCase(gh<_i11.CategoriesRepository>()));
    gh.factory<_i14.LayoutCubit>(() => _i14.LayoutCubit());
    gh.factory<_i15.ProductsDataSource>(
        () => _i16.ProductsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i17.ProductsRepository>(
        () => _i18.ProductsRepositoryImp(gh<_i15.ProductsDataSource>()));
    gh.factory<_i19.ProductsUseCase>(
        () => _i19.ProductsUseCase(gh<_i17.ProductsRepository>()));
    gh.factory<_i20.HomeCubit>(() => _i20.HomeCubit(
          gh<_i13.CategoriesUseCase>(),
          gh<_i8.BrandsUseCase>(),
          gh<_i19.ProductsUseCase>(),
        ));
    gh.factory<_i21.HomeCubit>(() => _i21.HomeCubit(
          gh<_i13.CategoriesUseCase>(),
          gh<_i8.BrandsUseCase>(),
          gh<_i19.ProductsUseCase>(),
        ));
    return this;
  }
}
