import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../domain/entities/home/product_entity.dart';

abstract class CategoryProductsDataSource {
  Future<Either<ServerFailure, List<Product>?>> getCategoryProducts(
      String categoryId);
}
