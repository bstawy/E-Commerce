import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/home_repository.dart';

abstract class HomeRemoteDataSource {
  Future<Either<ServerFailure, List<Category>>> getCategories();

  Future<Either<ServerFailure, List<Brand>>> getBrands();

  Future<Either<ServerFailure, List<Product>>> getProducts(
      ProductsSort? sortBy);
}
