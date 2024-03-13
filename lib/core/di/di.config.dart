// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/auth/login_data_source.dart' as _i21;
import '../../data/data_source/auth/register_data_source.dart' as _i26;
import '../../data/data_source/categories/categories_local_data_source.dart'
    as _i39;
import '../../data/data_source/categories/categories_remote_data_source.dart'
    as _i41;
import '../../data/data_source/category_products/category_products_local_data_source.dart'
    as _i4;
import '../../data/data_source/category_products/category_products_remote_data_source.dart'
    as _i6;
import '../../data/data_source/home/home_local_data_source.dart' as _i14;
import '../../data/data_source/home/home_remote_data_source.dart' as _i16;
import '../../data/data_source/wish_list/wish_list_local_data_source.dart'
    as _i31;
import '../../data/data_source/wish_list/wish_list_remote_data_source.dart'
    as _i33;
import '../../data/data_source_imp/auth/login_data_source_imp.dart' as _i22;
import '../../data/data_source_imp/auth/register_data_source_imp.dart' as _i27;
import '../../data/data_source_imp/categories/categories_local_data_source_impl.dart'
    as _i40;
import '../../data/data_source_imp/categories/categories_remote_data_source_impl.dart'
    as _i42;
import '../../data/data_source_imp/category_products/category_products_local_data_source_impl.dart'
    as _i5;
import '../../data/data_source_imp/category_products/category_products_remote_data_source_impl.dart'
    as _i7;
import '../../data/data_source_imp/home/home_local_data_source_impl.dart'
    as _i15;
import '../../data/data_source_imp/home/home_remote_data_source_impl.dart'
    as _i17;
import '../../data/data_source_imp/wish_list/wish_list_local_data_source_impl.dart'
    as _i32;
import '../../data/data_source_imp/wish_list/wish_list_remote_data_source_impl.dart'
    as _i34;
import '../../data/repository_imp/auth/login_repository_imp.dart' as _i24;
import '../../data/repository_imp/auth/register_repository_imp.dart' as _i29;
import '../../data/repository_imp/categories/categories_repository_impl.dart'
    as _i44;
import '../../data/repository_imp/categories_products/category_products_repository_imp.dart'
    as _i9;
import '../../data/repository_imp/home/home_repository_imp.dart' as _i19;
import '../../data/repository_imp/wish_list/wish_list_repository_imp.dart'
    as _i36;
import '../../domain/repository/auth/login_repository.dart' as _i23;
import '../../domain/repository/auth/register_repository.dart' as _i28;
import '../../domain/repository/categories/categories_repository.dart' as _i43;
import '../../domain/repository/category_products_repository/category_products_repository.dart'
    as _i8;
import '../../domain/repository/home/home_repository.dart' as _i18;
import '../../domain/repository/wish_list/wish_list_repository.dart' as _i35;
import '../../domain/use_case/add_product_to_wish_list_use_case.dart' as _i37;
import '../../domain/use_case/get_brands_use_case.dart' as _i46;
import '../../domain/use_case/get_categories_use_case.dart' as _i47;
import '../../domain/use_case/get_category_products_use_case.dart' as _i10;
import '../../domain/use_case/get_most_selling_products_use_case.dart' as _i48;
import '../../domain/use_case/get_sub_categories_on_category_use_case.dart'
    as _i49;
import '../../domain/use_case/get_wish_list_use_case.dart' as _i50;
import '../../domain/use_case/login_use_case.dart' as _i25;
import '../../domain/use_case/register_use_case.dart' as _i30;
import '../../domain/use_case/remove_product_from_wish_list_use_case.dart'
    as _i52;
import '../../features/auth/manager/auth_cubit.dart' as _i38;
import '../../features/category_products/manager/category_products_cubit.dart'
    as _i45;
import '../../features/home_layout/manager/home_layout_cubit.dart' as _i13;
import '../../features/home_layout/pages/views/categories_view/manager/categories_cubit/categories_cubit.dart'
    as _i54;
import '../../features/home_layout/pages/views/home_view/manager/home_cubit.dart'
    as _i51;
import '../../features/home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart'
    as _i53;
import '../config/constants.dart' as _i11;
import '../data_services/local_storage/hive_manager.dart' as _i12;
import '../data_services/local_storage/local_token_manager.dart' as _i20;
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
    gh.factory<_i4.CategoryProductsLocalDataSource>(
        () => _i5.CategoryProductsLocalDataSourceImpl());
    gh.factory<_i6.CategoryProductsRemoteDataSource>(
        () => _i7.CategoryProductsRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.CategoryProductsRepository>(
        () => _i9.CategoryProductsRepositoryImp(
              gh<_i6.CategoryProductsRemoteDataSource>(),
              gh<_i4.CategoryProductsLocalDataSource>(),
            ));
    gh.factory<_i10.GetCategoryProductsUseCase>(() =>
        _i10.GetCategoryProductsUseCase(gh<_i8.CategoryProductsRepository>()));
    gh.factory<_i11.HiveBoxKeys>(() => _i11.HiveBoxKeys());
    gh.singleton<_i12.HiveManager>(_i12.HiveManager());
    gh.factory<_i13.HomeLayoutCubit>(() => _i13.HomeLayoutCubit());
    gh.factory<_i14.HomeLocalDataSource>(
        () => _i15.HomeLocalDataSourceImpl(gh<_i12.HiveManager>()));
    gh.factory<_i16.HomeRemoteDataSource>(() => _i17.HomeRemoteDataSourceImpl(
          gh<_i3.ApiManager>(),
          gh<_i12.HiveManager>(),
        ));
    gh.factory<_i18.HomeRepository>(() => _i19.HomeRepositoryImp(
          gh<_i16.HomeRemoteDataSource>(),
          gh<_i14.HomeLocalDataSource>(),
        ));
    gh.factory<_i20.LocalTokenManager>(() => _i20.LocalTokenManager());
    gh.factory<_i21.LoginDataSource>(
        () => _i22.LoginDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i23.LoginRepository>(() => _i24.LoginRepositoryImp(
          gh<_i21.LoginDataSource>(),
          gh<_i20.LocalTokenManager>(),
        ));
    gh.factory<_i25.LoginUseCase>(
        () => _i25.LoginUseCase(gh<_i23.LoginRepository>()));
    gh.factory<_i26.RegisterDataSource>(
        () => _i27.RegisterDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i28.RegisterRepository>(
        () => _i29.RegisterRepositoryImp(gh<_i26.RegisterDataSource>()));
    gh.factory<_i30.RegisterUseCase>(
        () => _i30.RegisterUseCase(gh<_i28.RegisterRepository>()));
    gh.factory<_i31.WishListLocalDataSource>(
        () => _i32.WishListLocalDataSourceImpl(gh<_i12.HiveManager>()));
    gh.factory<_i33.WishListRemoteDataSource>(
        () => _i34.WishListRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i35.WishListRepository>(() => _i36.WishListRepositoryImp(
          gh<_i33.WishListRemoteDataSource>(),
          gh<_i31.WishListLocalDataSource>(),
        ));
    gh.factory<_i37.AddProductToWishListUseCase>(
        () => _i37.AddProductToWishListUseCase(gh<_i35.WishListRepository>()));
    gh.factory<_i38.AuthCubit>(() => _i38.AuthCubit(
          gh<_i30.RegisterUseCase>(),
          gh<_i25.LoginUseCase>(),
        ));
    gh.factory<_i39.CategoriesLocalDataSource>(
        () => _i40.CategoriesLocalDataSourceImpl(gh<_i12.HiveManager>()));
    gh.factory<_i41.CategoriesRemoteDataSource>(
        () => _i42.CategoriesRemoteDataSourceImpl(
              gh<_i3.ApiManager>(),
              gh<_i12.HiveManager>(),
            ));
    gh.factory<_i43.CategoriesRepository>(() => _i44.CategoriesRepositoryImpl(
          gh<_i41.CategoriesRemoteDataSource>(),
          gh<_i39.CategoriesLocalDataSource>(),
        ));
    gh.factory<_i45.CategoryProductsCubit>(() =>
        _i45.CategoryProductsCubit(gh<_i10.GetCategoryProductsUseCase>()));
    gh.factory<_i46.GetBrandsUseCase>(
        () => _i46.GetBrandsUseCase(gh<_i18.HomeRepository>()));
    gh.factory<_i47.GetCategoriesUseCase>(
        () => _i47.GetCategoriesUseCase(gh<_i18.HomeRepository>()));
    gh.factory<_i48.GetMostSellingProductsUseCase>(
        () => _i48.GetMostSellingProductsUseCase(gh<_i18.HomeRepository>()));
    gh.factory<_i49.GetSubCategoriesOnCategoryUseCase>(() =>
        _i49.GetSubCategoriesOnCategoryUseCase(
            gh<_i43.CategoriesRepository>()));
    gh.factory<_i50.GetWishListUseCase>(
        () => _i50.GetWishListUseCase(gh<_i35.WishListRepository>()));
    gh.factory<_i51.HomeCubit>(() => _i51.HomeCubit(
          gh<_i47.GetCategoriesUseCase>(),
          gh<_i46.GetBrandsUseCase>(),
          gh<_i48.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i52.RemoveProductFromWishListUseCase>(() =>
        _i52.RemoveProductFromWishListUseCase(gh<_i35.WishListRepository>()));
    gh.factory<_i53.WishListCubit>(() => _i53.WishListCubit(
          gh<_i20.LocalTokenManager>(),
          gh<_i50.GetWishListUseCase>(),
          gh<_i52.RemoveProductFromWishListUseCase>(),
          gh<_i37.AddProductToWishListUseCase>(),
        ));
    gh.factory<_i54.CategoriesCubit>(() => _i54.CategoriesCubit(
          gh<_i47.GetCategoriesUseCase>(),
          gh<_i49.GetSubCategoriesOnCategoryUseCase>(),
        ));
    return this;
  }
}
