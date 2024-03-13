import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/home_repository.dart';
import '../../data_source/home/home_local_data_source.dart';
import '../../data_source/home/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  @factoryMethod
  HomeRepositoryImp(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<ServerFailure, List<Brand>>> getBrands() async {
    List<Brand> brands = homeLocalDataSource.getBrands();
    if (brands.isNotEmpty) {
      return Right(brands);
    }

    return await homeRemoteDataSource.getBrands();
  }

  @override
  Future<Either<ServerFailure, List<Category>>> getCategories() async {
    List<Category> categories = homeLocalDataSource.getCategories();
    if (categories.isNotEmpty) {
      return Right(categories);
    }

    var response = await homeRemoteDataSource.getCategories();

    return response.fold(
      (serverFailure) {
        return Left(serverFailure);
      },
      (categories) {
        return Right(categories);
      },
    );
  }

  @override
  Future<Either<ServerFailure, List<Product>>> getProducts(
      ProductsSort? sortBy) async {
    List<Product> products = homeLocalDataSource.getProducts();
    if (products.isNotEmpty) {
      return Right(products);
    }

    var response = await homeRemoteDataSource.getProducts(sortBy);

    return response.fold(
      (serverFailure) {
        return Left(serverFailure);
      },
      (products) {
        return Right(products);
      },
    );
  }
}
