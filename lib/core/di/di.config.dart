// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/auth/login_data_source.dart' as _i19;
import '../../data/data_source/auth/register_data_source.dart' as _i24;
import '../../data/data_source/cart/cart_remote_data_source.dart' as _i4;
import '../../data/data_source/categories/categories_local_data_source.dart'
    as _i39;
import '../../data/data_source/categories/categories_remote_data_source.dart'
    as _i41;
import '../../data/data_source/category_products/category_products_local_data_source.dart'
    as _i45;
import '../../data/data_source/category_products/category_products_remote_data_source.dart'
    as _i47;
import '../../data/data_source/home/home_local_data_source.dart' as _i12;
import '../../data/data_source/home/home_remote_data_source.dart' as _i14;
import '../../data/data_source/wish_list/wish_list_local_data_source.dart'
    as _i29;
import '../../data/data_source/wish_list/wish_list_remote_data_source.dart'
    as _i31;
import '../../data/data_source_imp/auth/login_data_source_imp.dart' as _i20;
import '../../data/data_source_imp/auth/register_data_source_imp.dart' as _i25;
import '../../data/data_source_imp/cart/cart_remote_data_source_impl.dart'
    as _i5;
import '../../data/data_source_imp/categories/categories_local_data_source_impl.dart'
    as _i40;
import '../../data/data_source_imp/categories/categories_remote_data_source_impl.dart'
    as _i42;
import '../../data/data_source_imp/category_products/category_products_local_data_source_impl.dart'
    as _i46;
import '../../data/data_source_imp/category_products/category_products_remote_data_source_impl.dart'
    as _i48;
import '../../data/data_source_imp/home/home_local_data_source_impl.dart'
    as _i13;
import '../../data/data_source_imp/home/home_remote_data_source_impl.dart'
    as _i15;
import '../../data/data_source_imp/wish_list/wish_list_local_data_source_impl.dart'
    as _i30;
import '../../data/data_source_imp/wish_list/wish_list_remote_data_source_impl.dart'
    as _i32;
import '../../data/repository_imp/auth/login_repository_imp.dart' as _i22;
import '../../data/repository_imp/auth/register_repository_imp.dart' as _i27;
import '../../data/repository_imp/cart/cart_repository_impl.dart' as _i7;
import '../../data/repository_imp/categories/categories_repository_impl.dart'
    as _i44;
import '../../data/repository_imp/categories_products/category_products_repository_imp.dart'
    as _i50;
import '../../data/repository_imp/home/home_repository_imp.dart' as _i17;
import '../../data/repository_imp/wish_list/wish_list_repository_imp.dart'
    as _i34;
import '../../domain/repository/auth/login_repository.dart' as _i21;
import '../../domain/repository/auth/register_repository.dart' as _i26;
import '../../domain/repository/cart/cart_repository.dart' as _i6;
import '../../domain/repository/categories/categories_repository.dart' as _i43;
import '../../domain/repository/category_products/category_products_repository.dart'
    as _i49;
import '../../domain/repository/home/home_repository.dart' as _i16;
import '../../domain/repository/wish_list/wish_list_repository.dart' as _i33;
import '../../domain/use_case/add_product_to_cart_use_case.dart' as _i35;
import '../../domain/use_case/add_product_to_wish_list_use_case.dart' as _i36;
import '../../domain/use_case/get_brands_use_case.dart' as _i51;
import '../../domain/use_case/get_cart_products_use_case.dart' as _i8;
import '../../domain/use_case/get_categories_use_case.dart' as _i52;
import '../../domain/use_case/get_category_products_use_case.dart' as _i53;
import '../../domain/use_case/get_most_selling_products_use_case.dart' as _i54;
import '../../domain/use_case/get_sub_categories_on_category_use_case.dart'
    as _i55;
import '../../domain/use_case/get_wish_list_use_case.dart' as _i56;
import '../../domain/use_case/login_use_case.dart' as _i23;
import '../../domain/use_case/register_use_case.dart' as _i28;
import '../../domain/use_case/remove_product_from_wish_list_use_case.dart'
    as _i58;
import '../../features/auth/manager/auth_cubit.dart' as _i37;
import '../../features/cart/manager/cart_cubit_cubit.dart' as _i38;
import '../../features/category_products/manager/category_products_cubit.dart'
    as _i62;
import '../../features/home_layout/manager/home_layout_cubit.dart' as _i11;
import '../../features/home_layout/pages/views/categories_view/manager/categories_cubit/categories_cubit.dart'
    as _i61;
import '../../features/home_layout/pages/views/categories_view/manager/sub_categories_cubit/sub_categories_cubit.dart'
    as _i59;
import '../../features/home_layout/pages/views/home_view/manager/home_cubit.dart'
    as _i57;
import '../../features/home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart'
    as _i60;
import '../config/constants.dart' as _i9;
import '../data_services/local_storage/hive_manager.dart' as _i10;
import '../data_services/local_storage/local_token_manager.dart' as _i18;
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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.CartRemoteDataSource>(
        () => _i5.CartRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CartRepository>(
        () => _i7.CartRepositoryImpl(gh<_i4.CartRemoteDataSource>()));
    gh.factory<_i8.GetCartProductsUseCase>(
        () => _i8.GetCartProductsUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i9.HiveBoxKeys>(() => _i9.HiveBoxKeys());
    gh.singleton<_i10.HiveManager>(() => _i10.HiveManager());
    gh.factory<_i11.HomeLayoutCubit>(() => _i11.HomeLayoutCubit());
    gh.factory<_i12.HomeLocalDataSource>(
        () => _i13.HomeLocalDataSourceImpl(gh<_i10.HiveManager>()));
    gh.factory<_i14.HomeRemoteDataSource>(() => _i15.HomeRemoteDataSourceImpl(
          gh<_i3.ApiManager>(),
          gh<_i10.HiveManager>(),
        ));
    gh.factory<_i16.HomeRepository>(() => _i17.HomeRepositoryImp(
          gh<_i14.HomeRemoteDataSource>(),
          gh<_i12.HomeLocalDataSource>(),
        ));
    gh.factory<_i18.LocalTokenManager>(() => _i18.LocalTokenManager());
    gh.factory<_i19.LoginDataSource>(
        () => _i20.LoginDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i21.LoginRepository>(() => _i22.LoginRepositoryImp(
          gh<_i19.LoginDataSource>(),
          gh<_i18.LocalTokenManager>(),
        ));
    gh.factory<_i23.LoginUseCase>(
        () => _i23.LoginUseCase(gh<_i21.LoginRepository>()));
    gh.factory<_i24.RegisterDataSource>(
        () => _i25.RegisterDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i26.RegisterRepository>(
        () => _i27.RegisterRepositoryImp(gh<_i24.RegisterDataSource>()));
    gh.factory<_i28.RegisterUseCase>(
        () => _i28.RegisterUseCase(gh<_i26.RegisterRepository>()));
    gh.factory<_i29.WishListLocalDataSource>(
        () => _i30.WishListLocalDataSourceImpl(gh<_i10.HiveManager>()));
    gh.factory<_i31.WishListRemoteDataSource>(
        () => _i32.WishListRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i33.WishListRepository>(() => _i34.WishListRepositoryImp(
          gh<_i31.WishListRemoteDataSource>(),
          gh<_i29.WishListLocalDataSource>(),
        ));
    gh.factory<_i35.AddProductToCartUseCase>(
        () => _i35.AddProductToCartUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i36.AddProductToWishListUseCase>(
        () => _i36.AddProductToWishListUseCase(gh<_i33.WishListRepository>()));
    gh.factory<_i37.AuthCubit>(() => _i37.AuthCubit(
          gh<_i28.RegisterUseCase>(),
          gh<_i23.LoginUseCase>(),
        ));
    gh.factory<_i38.CartCubit>(
        () => _i38.CartCubit(gh<_i35.AddProductToCartUseCase>()));
    gh.factory<_i39.CategoriesLocalDataSource>(
        () => _i40.CategoriesLocalDataSourceImpl(gh<_i10.HiveManager>()));
    gh.factory<_i41.CategoriesRemoteDataSource>(
        () => _i42.CategoriesRemoteDataSourceImpl(
              gh<_i3.ApiManager>(),
              gh<_i10.HiveManager>(),
            ));
    gh.factory<_i43.CategoriesRepository>(() => _i44.CategoriesRepositoryImpl(
          gh<_i41.CategoriesRemoteDataSource>(),
          gh<_i39.CategoriesLocalDataSource>(),
        ));
    gh.factory<_i45.CategoryProductsLocalDataSource>(
        () => _i46.CategoryProductsLocalDataSourceImpl(gh<_i10.HiveManager>()));
    gh.factory<_i47.CategoryProductsRemoteDataSource>(
        () => _i48.CategoryProductsRemoteDataSourceImpl(
              gh<_i3.ApiManager>(),
              gh<_i10.HiveManager>(),
            ));
    gh.factory<_i49.CategoryProductsRepository>(
        () => _i50.CategoryProductsRepositoryImp(
              gh<_i47.CategoryProductsRemoteDataSource>(),
              gh<_i45.CategoryProductsLocalDataSource>(),
            ));
    gh.factory<_i51.GetBrandsUseCase>(
        () => _i51.GetBrandsUseCase(gh<_i16.HomeRepository>()));
    gh.factory<_i52.GetCategoriesUseCase>(
        () => _i52.GetCategoriesUseCase(gh<_i16.HomeRepository>()));
    gh.factory<_i53.GetCategoryProductsUseCase>(() =>
        _i53.GetCategoryProductsUseCase(gh<_i49.CategoryProductsRepository>()));
    gh.factory<_i54.GetMostSellingProductsUseCase>(
        () => _i54.GetMostSellingProductsUseCase(gh<_i16.HomeRepository>()));
    gh.factory<_i55.GetSubCategoriesOnCategoryUseCase>(() =>
        _i55.GetSubCategoriesOnCategoryUseCase(
            gh<_i43.CategoriesRepository>()));
    gh.factory<_i56.GetWishListUseCase>(
        () => _i56.GetWishListUseCase(gh<_i33.WishListRepository>()));
    gh.factory<_i57.HomeCubit>(() => _i57.HomeCubit(
          gh<_i52.GetCategoriesUseCase>(),
          gh<_i51.GetBrandsUseCase>(),
          gh<_i54.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i58.RemoveProductFromWishListUseCase>(() =>
        _i58.RemoveProductFromWishListUseCase(gh<_i33.WishListRepository>()));
    gh.factory<_i59.SubCategoriesCubit>(() =>
        _i59.SubCategoriesCubit(gh<_i55.GetSubCategoriesOnCategoryUseCase>()));
    gh.factory<_i60.WishListCubit>(() => _i60.WishListCubit(
          gh<_i18.LocalTokenManager>(),
          gh<_i56.GetWishListUseCase>(),
          gh<_i58.RemoveProductFromWishListUseCase>(),
          gh<_i36.AddProductToWishListUseCase>(),
        ));
    gh.factory<_i61.CategoriesCubit>(
        () => _i61.CategoriesCubit(gh<_i52.GetCategoriesUseCase>()));
    gh.factory<_i62.CategoryProductsCubit>(() =>
        _i62.CategoryProductsCubit(gh<_i53.GetCategoryProductsUseCase>()));
    return this;
  }
}
