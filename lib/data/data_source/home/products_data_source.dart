import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';

import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/products_repository.dart';

abstract class ProductsDataSource {
  Future<Either<ServerFailure, List<Product>?>> getProducts(
      {ProductsSort? sortBy});
}
