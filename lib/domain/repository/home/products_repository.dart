import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';

import '../../entities/home/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<ServerFailure, List<Product>?>> getProducts(
      {ProductsSort? sortBy});
}

enum ProductsSort {
  mostSelling("-sold"),
  lowestPrice("price"),
  highestPrice("-price");

  final String value;

  const ProductsSort(this.value);
}
