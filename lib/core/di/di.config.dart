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
import '../../data/data_source/auth/register_data_source.dart' as _i31;
import '../../data/data_source/categories/sub_categories_data_source.dart'
    as _i36;
import '../../data/data_source/category_products/category_products_data_source.dart'
    as _i14;
import '../../data/data_source/home/brands_data_source.dart' as _i4;
import '../../data/data_source/home/categories_data_source.dart' as _i9;
import '../../data/data_source/home/products_data_source.dart' as _i26;
import '../../data/data_source/wish_list/wish_list_data_source.dart' as _i40;
import '../../data/data_source_imp/auth/login_data_source_imp.dart' as _i22;
import '../../data/data_source_imp/auth/register_data_source_imp.dart' as _i32;
import '../../data/data_source_imp/categories/sub_categories_online_data_source_imp.dart'
    as _i37;
import '../../data/data_source_imp/category_products/category_products_online_data_source_imp.dart'
    as _i15;
import '../../data/data_source_imp/home/brands_online_data_source_imp.dart'
    as _i5;
import '../../data/data_source_imp/home/categories_online_data_source_imp.dart'
    as _i10;
import '../../data/data_source_imp/home/products_online_data_source_imp.dart'
    as _i27;
import '../../data/data_source_imp/wish_list/wish_list_online_data_source_imp.dart'
    as _i41;
import '../../data/repository_imp/auth/login_repository_imp.dart' as _i24;
import '../../data/repository_imp/auth/register_repository_imp.dart' as _i34;
import '../../data/repository_imp/categories/sub_categories_repository_imp.dart'
    as _i39;
import '../../data/repository_imp/categories_products/category_products_repository_imp.dart'
    as _i17;
import '../../data/repository_imp/home/brands_repository_imp.dart' as _i7;
import '../../data/repository_imp/home/categories_repository_imp.dart' as _i12;
import '../../data/repository_imp/home/products_repository_imp.dart' as _i29;
import '../../data/repository_imp/wish_list/wish_list_repository_imp.dart'
    as _i43;
import '../../domain/repository/auth/login_repository.dart' as _i23;
import '../../domain/repository/auth/register_repository.dart' as _i33;
import '../../domain/repository/categories/sub_categories_repository.dart'
    as _i38;
import '../../domain/repository/category_products_repository/category_products_repository.dart'
    as _i16;
import '../../domain/repository/home/brands_repository.dart' as _i6;
import '../../domain/repository/home/categories_repository.dart' as _i11;
import '../../domain/repository/home/products_repository.dart' as _i28;
import '../../domain/repository/wish_list/wish_list_repository.dart' as _i42;
import '../../domain/use_case/add_product_to_wish_list_use_case.dart' as _i45;
import '../../domain/use_case/brands_use_case.dart' as _i8;
import '../../domain/use_case/categories_use_case.dart' as _i13;
import '../../domain/use_case/category_products_use_case.dart' as _i18;
import '../../domain/use_case/login_use_case.dart' as _i25;
import '../../domain/use_case/products_use_case.dart' as _i30;
import '../../domain/use_case/register_use_case.dart' as _i35;
import '../../domain/use_case/remove_product_from_wish_list_use_case.dart'
    as _i49;
import '../../domain/use_case/sub_categories_on_category_use_case.dart' as _i50;
import '../../domain/use_case/wish_list_use_case.dart' as _i44;
import '../../features/auth/manager/auth_cubit.dart' as _i46;
import '../../features/category_products/manager/category_products_cubit.dart'
    as _i47;
import '../../features/home_layout/manager/home_layout_cubit.dart' as _i19;
import '../../features/home_layout/pages/views/categories_view/manager/cubit/categories_cubit.dart'
    as _i52;
import '../../features/home_layout/pages/views/home_view/manager/home_cubit.dart'
    as _i48;
import '../../features/home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart'
    as _i51;
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
    gh.factory<_i14.CategoryProductsDataSource>(
        () => _i15.CategoryProductsOnlineDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i16.CategoryProductsRepository>(() =>
        _i17.CategoryProductsRepositoryImp(
            gh<_i14.CategoryProductsDataSource>()));
    gh.factory<_i18.CategoryProductsUseCase>(() =>
        _i18.CategoryProductsUseCase(gh<_i16.CategoryProductsRepository>()));
    gh.factory<_i19.HomeLayoutCubit>(() => _i19.HomeLayoutCubit());
    gh.factory<_i20.LocalTokenManager>(() => _i20.LocalTokenManager());
    gh.factory<_i21.LoginDataSource>(
        () => _i22.LoginDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i23.LoginRepository>(() => _i24.LoginRepositoryImp(
          gh<_i21.LoginDataSource>(),
          gh<_i20.LocalTokenManager>(),
        ));
    gh.factory<_i25.LoginUseCase>(
        () => _i25.LoginUseCase(gh<_i23.LoginRepository>()));
    gh.factory<_i26.ProductsDataSource>(
        () => _i27.ProductsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i28.ProductsRepository>(
        () => _i29.ProductsRepositoryImp(gh<_i26.ProductsDataSource>()));
    gh.factory<_i30.ProductsUseCase>(
        () => _i30.ProductsUseCase(gh<_i28.ProductsRepository>()));
    gh.factory<_i31.RegisterDataSource>(
        () => _i32.RegisterDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i33.RegisterRepository>(
        () => _i34.RegisterRepositoryImp(gh<_i31.RegisterDataSource>()));
    gh.factory<_i35.RegisterUseCase>(
        () => _i35.RegisterUseCase(gh<_i33.RegisterRepository>()));
    gh.factory<_i36.SubCategoriesDataSource>(
        () => _i37.SubCategoriesOnlineDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i38.SubCategoriesRepository>(() =>
        _i39.SubCategoriesRepositoryImp(gh<_i36.SubCategoriesDataSource>()));
    gh.factory<_i40.WishListDataSource>(
        () => _i41.WishListOnlineDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i42.WishListRepository>(
        () => _i43.WishListRepositoryImp(gh<_i40.WishListDataSource>()));
    gh.factory<_i44.WishListUseCase>(
        () => _i44.WishListUseCase(gh<_i42.WishListRepository>()));
    gh.factory<_i45.AddProductToWishListUseCase>(
        () => _i45.AddProductToWishListUseCase(gh<_i42.WishListRepository>()));
    gh.factory<_i46.AuthCubit>(() => _i46.AuthCubit(
          gh<_i35.RegisterUseCase>(),
          gh<_i25.LoginUseCase>(),
        ));
    gh.factory<_i47.CategoryProductsCubit>(
        () => _i47.CategoryProductsCubit(gh<_i18.CategoryProductsUseCase>()));
    gh.factory<_i48.HomeCubit>(() => _i48.HomeCubit(
          gh<_i13.CategoriesUseCase>(),
          gh<_i8.BrandsUseCase>(),
          gh<_i30.ProductsUseCase>(),
        ));
    gh.factory<_i49.RemoveProductFromWishListUseCase>(() =>
        _i49.RemoveProductFromWishListUseCase(gh<_i42.WishListRepository>()));
    gh.factory<_i50.SubCategoriesOnCategoryUseCase>(() =>
        _i50.SubCategoriesOnCategoryUseCase(
            gh<_i38.SubCategoriesRepository>()));
    gh.factory<_i51.WishListCubit>(() => _i51.WishListCubit(
          gh<_i20.LocalTokenManager>(),
          gh<_i44.WishListUseCase>(),
          gh<_i49.RemoveProductFromWishListUseCase>(),
          gh<_i45.AddProductToWishListUseCase>(),
        ));
    gh.factory<_i52.CategoriesCubit>(() => _i52.CategoriesCubit(
          gh<_i13.CategoriesUseCase>(),
          gh<_i50.SubCategoriesOnCategoryUseCase>(),
        ));
    return this;
  }
}
