import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/products_repository.dart';
import '../../data_source/home/products_data_source.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImp extends ProductsRepository {
  ProductsDataSource productsDataSource;

  @factoryMethod
  ProductsRepositoryImp(this.productsDataSource);

  @override
  Future<Either<ServerFailure, List<Product>?>> getProducts(
      {ProductsSort? sortBy}) async {
    var response = await productsDataSource.getProducts(sortBy: sortBy);

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
