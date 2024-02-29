// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/auth/login_data_source.dart' as _i16;
import '../../data/data_source/auth/register_data_source.dart' as _i26;
import '../../data/data_source/home/brands_data_source.dart' as _i4;
import '../../data/data_source/home/categories_data_source.dart' as _i9;
import '../../data/data_source/home/products_data_source.dart' as _i21;
import '../../data/data_source/wish_list/wish_list_data_source.dart' as _i31;
import '../../data/data_source_imp/auth/login_data_source_imp.dart' as _i17;
import '../../data/data_source_imp/auth/register_data_source_imp.dart' as _i27;
import '../../data/data_source_imp/home/brands_online_data_source_imp.dart'
    as _i5;
import '../../data/data_source_imp/home/categories_online_data_source_imp.dart'
    as _i10;
import '../../data/data_source_imp/home/products_online_data_source_imp.dart'
    as _i22;
import '../../data/data_source_imp/wish_list/wish_list_online_data_source_imp.dart'
    as _i32;
import '../../data/repository_imp/auth/login_repository_imp.dart' as _i19;
import '../../data/repository_imp/auth/register_repository_imp.dart' as _i29;
import '../../data/repository_imp/home/brands_repository_imp.dart' as _i7;
import '../../data/repository_imp/home/categories_repository_imp.dart' as _i12;
import '../../data/repository_imp/home/products_repository_imp.dart' as _i24;
import '../../data/repository_imp/wish_list/wish_list_repository_imp.dart'
    as _i34;
import '../../domain/repository/auth/login_repository.dart' as _i18;
import '../../domain/repository/auth/register_repository.dart' as _i28;
import '../../domain/repository/home/brands_repository.dart' as _i6;
import '../../domain/repository/home/categories_repository.dart' as _i11;
import '../../domain/repository/home/products_repository.dart' as _i23;
import '../../domain/repository/wish_list/wish_list_repository.dart' as _i33;
import '../../domain/use_case/brands_use_case.dart' as _i8;
import '../../domain/use_case/categories_use_case.dart' as _i13;
import '../../domain/use_case/login_use_case.dart' as _i20;
import '../../domain/use_case/products_use_case.dart' as _i25;
import '../../domain/use_case/register_use_case.dart' as _i30;
import '../../domain/use_case/wish_list_use_case.dart' as _i35;
import '../../features/auth/manager/auth_cubit.dart' as _i36;
import '../../features/home_layout/manager/home_layout_cubit.dart' as _i14;
import '../../features/home_layout/pages/views/home_view/manager/home_cubit.dart'
    as _i37;
import '../../features/home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart'
    as _i38;
import '../data_services/local_storage/local_token_manager.dart' as _i15;
import '../data_services/web_services/api_manager.dart' as _i3;

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
    gh.factory<_i14.HomeLayoutCubit>(() => _i14.HomeLayoutCubit());
    gh.factory<_i15.LocalTokenManager>(() => _i15.LocalTokenManager());
    gh.factory<_i16.LoginDataSource>(
        () => _i17.LoginDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i18.LoginRepository>(() => _i19.LoginRepositoryImp(
          gh<_i16.LoginDataSource>(),
          gh<_i15.LocalTokenManager>(),
        ));
    gh.factory<_i20.LoginUseCase>(
        () => _i20.LoginUseCase(gh<_i18.LoginRepository>()));
    gh.factory<_i21.ProductsDataSource>(
        () => _i22.ProductsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i23.ProductsRepository>(
        () => _i24.ProductsRepositoryImp(gh<_i21.ProductsDataSource>()));
    gh.factory<_i25.ProductsUseCase>(
        () => _i25.ProductsUseCase(gh<_i23.ProductsRepository>()));
    gh.factory<_i26.RegisterDataSource>(
        () => _i27.RegisterDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i28.RegisterRepository>(
        () => _i29.RegisterRepositoryImp(gh<_i26.RegisterDataSource>()));
    gh.factory<_i30.RegisterUseCase>(
        () => _i30.RegisterUseCase(gh<_i28.RegisterRepository>()));
    gh.factory<_i31.WishListDataSource>(
        () => _i32.WishListOnlineDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i33.WishListRepository>(
        () => _i34.WishListRepositoryImp(gh<_i31.WishListDataSource>()));
    gh.factory<_i35.WishListUseCase>(
        () => _i35.WishListUseCase(gh<_i33.WishListRepository>()));
    gh.factory<_i36.AuthCubit>(() => _i36.AuthCubit(
          gh<_i30.RegisterUseCase>(),
          gh<_i20.LoginUseCase>(),
        ));
    gh.factory<_i37.HomeCubit>(() => _i37.HomeCubit(
          gh<_i13.CategoriesUseCase>(),
          gh<_i8.BrandsUseCase>(),
          gh<_i25.ProductsUseCase>(),
        ));
    gh.factory<_i38.WishListCubit>(() => _i38.WishListCubit(
          gh<_i15.LocalTokenManager>(),
          gh<_i35.WishListUseCase>(),
        ));
    return this;
  }
}
