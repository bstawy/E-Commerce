import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/category_products_repository/category_products_repository.dart';
import '../../data_source/category_products/category_products_data_source.dart';

@Injectable(as: CategoryProductsRepository)
class CategoryProductsRepositoryImp extends CategoryProductsRepository {
  CategoryProductsDataSource categoryProductsDataSource;

  @factoryMethod
  CategoryProductsRepositoryImp(this.categoryProductsDataSource);

  @override
  Future<Either<ServerFailure, List<Product>?>> getCategoryProducts(
      String categoryId) async {
    var response =
        await categoryProductsDataSource.getCategoryProducts(categoryId);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
