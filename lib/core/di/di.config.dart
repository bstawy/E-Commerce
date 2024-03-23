// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/auth/login_data_source.dart' as _i20;
import '../../data/data_source/auth/register_data_source.dart' as _i25;
import '../../data/data_source/cart/cart_remote_data_source.dart' as _i4;
import '../../data/data_source/categories/categories_local_data_source.dart'
    as _i42;
import '../../data/data_source/categories/categories_remote_data_source.dart'
    as _i44;
import '../../data/data_source/category_products/category_products_local_data_source.dart'
    as _i48;
import '../../data/data_source/category_products/category_products_remote_data_source.dart'
    as _i50;
import '../../data/data_source/home/home_local_data_source.dart' as _i13;
import '../../data/data_source/home/home_remote_data_source.dart' as _i15;
import '../../data/data_source/wish_list/wish_list_local_data_source.dart'
    as _i32;
import '../../data/data_source/wish_list/wish_list_remote_data_source.dart'
    as _i34;
import '../../data/data_source_imp/auth/login_data_source_imp.dart' as _i21;
import '../../data/data_source_imp/auth/register_data_source_imp.dart' as _i26;
import '../../data/data_source_imp/cart/cart_remote_data_source_impl.dart'
    as _i5;
import '../../data/data_source_imp/categories/categories_local_data_source_impl.dart'
    as _i43;
import '../../data/data_source_imp/categories/categories_remote_data_source_impl.dart'
    as _i45;
import '../../data/data_source_imp/category_products/category_products_local_data_source_impl.dart'
    as _i49;
import '../../data/data_source_imp/category_products/category_products_remote_data_source_impl.dart'
    as _i51;
import '../../data/data_source_imp/home/home_local_data_source_impl.dart'
    as _i14;
import '../../data/data_source_imp/home/home_remote_data_source_impl.dart'
    as _i16;
import '../../data/data_source_imp/wish_list/wish_list_local_data_source_impl.dart'
    as _i33;
import '../../data/data_source_imp/wish_list/wish_list_remote_data_source_impl.dart'
    as _i35;
import '../../data/repository_imp/auth/login_repository_imp.dart' as _i23;
import '../../data/repository_imp/auth/register_repository_imp.dart' as _i28;
import '../../data/repository_imp/cart/cart_repository_impl.dart' as _i7;
import '../../data/repository_imp/categories/categories_repository_impl.dart'
    as _i47;
import '../../data/repository_imp/categories_products/category_products_repository_imp.dart'
    as _i53;
import '../../data/repository_imp/home/home_repository_imp.dart' as _i18;
import '../../data/repository_imp/wish_list/wish_list_repository_imp.dart'
    as _i37;
import '../../domain/repository/auth/login_repository.dart' as _i22;
import '../../domain/repository/auth/register_repository.dart' as _i27;
import '../../domain/repository/cart/cart_repository.dart' as _i6;
import '../../domain/repository/categories/categories_repository.dart' as _i46;
import '../../domain/repository/category_products/category_products_repository.dart'
    as _i52;
import '../../domain/repository/home/home_repository.dart' as _i17;
import '../../domain/repository/wish_list/wish_list_repository.dart' as _i36;
import '../../domain/use_case/add_product_to_cart_use_case.dart' as _i38;
import '../../domain/use_case/add_product_to_wish_list_use_case.dart' as _i39;
import '../../domain/use_case/clear_cart_use_case.dart' as _i8;
import '../../domain/use_case/get_brands_use_case.dart' as _i54;
import '../../domain/use_case/get_cart_products_use_case.dart' as _i9;
import '../../domain/use_case/get_categories_use_case.dart' as _i55;
import '../../domain/use_case/get_category_products_use_case.dart' as _i56;
import '../../domain/use_case/get_most_selling_products_use_case.dart' as _i57;
import '../../domain/use_case/get_sub_categories_on_category_use_case.dart'
    as _i58;
import '../../domain/use_case/get_wish_list_use_case.dart' as _i59;
import '../../domain/use_case/login_use_case.dart' as _i24;
import '../../domain/use_case/register_use_case.dart' as _i29;
import '../../domain/use_case/remove_product_from_cart_use_case.dart' as _i30;
import '../../domain/use_case/remove_product_from_wish_list_use_case.dart'
    as _i61;
import '../../domain/use_case/update_cart_product_quantity_use_case.dart'
    as _i31;
import '../../features/auth/manager/auth_cubit.dart' as _i40;
import '../../features/cart/manager/cart_cubit.dart' as _i41;
import '../../features/category_products/manager/category_products_cubit.dart'
    as _i65;
import '../../features/home_layout/manager/home_layout_cubit.dart' as _i12;
import '../../features/home_layout/pages/views/categories_view/manager/categories_cubit/categories_cubit.dart'
    as _i64;
import '../../features/home_layout/pages/views/categories_view/manager/sub_categories_cubit/sub_categories_cubit.dart'
    as _i62;
import '../../features/home_layout/pages/views/home_view/manager/home_cubit.dart'
    as _i60;
import '../../features/home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart'
    as _i63;
import '../config/constants.dart' as _i10;
import '../data_services/local_storage/hive_manager.dart' as _i11;
import '../data_services/local_storage/local_token_manager.dart' as _i19;
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
    gh.singleton<_i3.ApiManager>((() => _i3.ApiManager()));
    gh.factory<_i4.CartRemoteDataSource>(
        () => _i5.CartRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CartRepository>(
        () => _i7.CartRepositoryImpl(gh<_i4.CartRemoteDataSource>()));
    gh.factory<_i8.ClearCartUseCase>(
        () => _i8.ClearCartUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i9.GetCartProductsUseCase>(
        () => _i9.GetCartProductsUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i10.HiveBoxKeys>(() => _i10.HiveBoxKeys());
    gh.singleton<_i11.HiveManager>(() => _i11.HiveManager());
    gh.factory<_i12.HomeLayoutCubit>(() => _i12.HomeLayoutCubit());
    gh.factory<_i13.HomeLocalDataSource>(
        () => _i14.HomeLocalDataSourceImpl(gh<_i11.HiveManager>()));
    gh.factory<_i15.HomeRemoteDataSource>(() => _i16.HomeRemoteDataSourceImpl(
          gh<_i3.ApiManager>(),
          gh<_i11.HiveManager>(),
        ));
    gh.factory<_i17.HomeRepository>(() => _i18.HomeRepositoryImp(
          gh<_i15.HomeRemoteDataSource>(),
          gh<_i13.HomeLocalDataSource>(),
        ));
    gh.factory<_i19.LocalTokenManager>(() => _i19.LocalTokenManager());
    gh.factory<_i20.LoginDataSource>(
        () => _i21.LoginDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i22.LoginRepository>(() => _i23.LoginRepositoryImp(
          gh<_i20.LoginDataSource>(),
          gh<_i19.LocalTokenManager>(),
        ));
    gh.factory<_i24.LoginUseCase>(
        () => _i24.LoginUseCase(gh<_i22.LoginRepository>()));
    gh.factory<_i25.RegisterDataSource>(
        () => _i26.RegisterDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i27.RegisterRepository>(
        () => _i28.RegisterRepositoryImp(gh<_i25.RegisterDataSource>()));
    gh.factory<_i29.RegisterUseCase>(
        () => _i29.RegisterUseCase(gh<_i27.RegisterRepository>()));
    gh.factory<_i30.RemoveProductFromCartUseCase>(
        () => _i30.RemoveProductFromCartUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i31.UpdateCartProductQuantityUseCase>(
        () => _i31.UpdateCartProductQuantityUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i32.WishListLocalDataSource>(
        () => _i33.WishListLocalDataSourceImpl(gh<_i11.HiveManager>()));
    gh.factory<_i34.WishListRemoteDataSource>(
        () => _i35.WishListRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i36.WishListRepository>(() => _i37.WishListRepositoryImp(
          gh<_i34.WishListRemoteDataSource>(),
          gh<_i32.WishListLocalDataSource>(),
        ));
    gh.factory<_i38.AddProductToCartUseCase>(
        () => _i38.AddProductToCartUseCase(gh<_i6.CartRepository>()));
    gh.factory<_i39.AddProductToWishListUseCase>(
        () => _i39.AddProductToWishListUseCase(gh<_i36.WishListRepository>()));
    gh.factory<_i40.AuthCubit>(() => _i40.AuthCubit(
          gh<_i29.RegisterUseCase>(),
          gh<_i24.LoginUseCase>(),
        ));
    gh.factory<_i41.CartCubit>(() => _i41.CartCubit(
          gh<_i38.AddProductToCartUseCase>(),
          gh<_i9.GetCartProductsUseCase>(),
          gh<_i30.RemoveProductFromCartUseCase>(),
          gh<_i31.UpdateCartProductQuantityUseCase>(),
          gh<_i8.ClearCartUseCase>(),
        ));
    gh.factory<_i42.CategoriesLocalDataSource>(
        () => _i43.CategoriesLocalDataSourceImpl(gh<_i11.HiveManager>()));
    gh.factory<_i44.CategoriesRemoteDataSource>(
        () => _i45.CategoriesRemoteDataSourceImpl(
              gh<_i3.ApiManager>(),
              gh<_i11.HiveManager>(),
            ));
    gh.factory<_i46.CategoriesRepository>(() => _i47.CategoriesRepositoryImpl(
          gh<_i44.CategoriesRemoteDataSource>(),
          gh<_i42.CategoriesLocalDataSource>(),
        ));
    gh.factory<_i48.CategoryProductsLocalDataSource>(
        () => _i49.CategoryProductsLocalDataSourceImpl(gh<_i11.HiveManager>()));
    gh.factory<_i50.CategoryProductsRemoteDataSource>(
        () => _i51.CategoryProductsRemoteDataSourceImpl(
              gh<_i3.ApiManager>(),
              gh<_i11.HiveManager>(),
            ));
    gh.factory<_i52.CategoryProductsRepository>(
        () => _i53.CategoryProductsRepositoryImp(
              gh<_i50.CategoryProductsRemoteDataSource>(),
              gh<_i48.CategoryProductsLocalDataSource>(),
            ));
    gh.factory<_i54.GetBrandsUseCase>(
        () => _i54.GetBrandsUseCase(gh<_i17.HomeRepository>()));
    gh.factory<_i55.GetCategoriesUseCase>(
        () => _i55.GetCategoriesUseCase(gh<_i17.HomeRepository>()));
    gh.factory<_i56.GetCategoryProductsUseCase>(() =>
        _i56.GetCategoryProductsUseCase(gh<_i52.CategoryProductsRepository>()));
    gh.factory<_i57.GetMostSellingProductsUseCase>(
        () => _i57.GetMostSellingProductsUseCase(gh<_i17.HomeRepository>()));
    gh.factory<_i58.GetSubCategoriesOnCategoryUseCase>(() =>
        _i58.GetSubCategoriesOnCategoryUseCase(
            gh<_i46.CategoriesRepository>()));
    gh.factory<_i59.GetWishListUseCase>(
        () => _i59.GetWishListUseCase(gh<_i36.WishListRepository>()));
    gh.factory<_i60.HomeCubit>(() => _i60.HomeCubit(
          gh<_i55.GetCategoriesUseCase>(),
          gh<_i54.GetBrandsUseCase>(),
          gh<_i57.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i61.RemoveProductFromWishListUseCase>(() =>
        _i61.RemoveProductFromWishListUseCase(gh<_i36.WishListRepository>()));
    gh.factory<_i62.SubCategoriesCubit>(() =>
        _i62.SubCategoriesCubit(gh<_i58.GetSubCategoriesOnCategoryUseCase>()));
    gh.factory<_i63.WishListCubit>(() => _i63.WishListCubit(
          gh<_i19.LocalTokenManager>(),
          gh<_i59.GetWishListUseCase>(),
          gh<_i61.RemoveProductFromWishListUseCase>(),
          gh<_i39.AddProductToWishListUseCase>(),
        ));
    gh.factory<_i64.CategoriesCubit>(
        () => _i64.CategoriesCubit(gh<_i55.GetCategoriesUseCase>()));
    gh.factory<_i65.CategoryProductsCubit>(() =>
        _i65.CategoryProductsCubit(gh<_i56.GetCategoryProductsUseCase>()));
    return this;
  }
}
