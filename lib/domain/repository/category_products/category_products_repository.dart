import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/home/product_entity.dart';

abstract class CategoryProductsRepository {
  Future<Either<ServerFailure, List<Product>?>> getCategoryProducts(
      String categoryId);
}
