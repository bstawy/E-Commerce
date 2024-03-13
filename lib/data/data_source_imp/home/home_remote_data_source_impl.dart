import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/home_repository.dart';
import '../../data_source/home/home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiManager apiManager;
  HiveManager hiveManager;

  @factoryMethod
  HomeRemoteDataSourceImpl(this.apiManager, this.hiveManager);

  @override
  Future<Either<ServerFailure, List<Brand>>> getBrands() async {
    var response = await apiManager.getBrands();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      List<Brand> brands =
          r.data!.map((brandDto) => brandDto.toBrand()).toList();

      hiveManager.cacheData<Brand>(
        boxKey: HiveBoxKeys.homeBrands,
        dataList: brands,
      );

      return Right(brands);
    });
  }

  @override
  Future<Either<ServerFailure, List<Category>>> getCategories() async {
    var response = await apiManager.getCategories();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      List<Category> categories =
          r.data!.map((categoryDto) => categoryDto.toCategory()).toList();

      hiveManager.cacheData<Category>(
        boxKey: HiveBoxKeys.homeCategories,
        dataList: categories,
      );

      return Right(categories);
    });
  }

  @override
  Future<Either<ServerFailure, List<Product>>> getProducts(
      ProductsSort? sortBy) async {
    var response = await apiManager.getProducts(sortBy);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      List<Product> products =
          r.data!.map((productDto) => productDto.toProduct()).toList();

      hiveManager.cacheData<Product>(
        boxKey: HiveBoxKeys.homeProducts,
        dataList: products,
      );

      return Right(products);
    });
  }
}
