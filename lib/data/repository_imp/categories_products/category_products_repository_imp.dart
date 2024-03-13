import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/category_products_repository/category_products_repository.dart';
import '../../data_source/category_products/category_products_local_data_source.dart';
import '../../data_source/category_products/category_products_remote_data_source.dart';

@Injectable(as: CategoryProductsRepository)
class CategoryProductsRepositoryImp extends CategoryProductsRepository {
  CategoryProductsRemoteDataSource categoryProductsRemoteDataSource;
  CategoryProductsLocalDataSource categoryProductsLocalDataSource;

  @factoryMethod
  CategoryProductsRepositoryImp(this.categoryProductsRemoteDataSource,
      this.categoryProductsLocalDataSource);

  @override
  Future<Either<ServerFailure, List<Product>?>> getCategoryProducts(

      // TODO: get local data
      String categoryId) async {
    var response =
        await categoryProductsRemoteDataSource.getCategoryProducts(categoryId);
    // TODO: cache data
    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
