import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../entities/home/brand_entity.dart';
import '../../entities/home/category_entity.dart';
import '../../entities/home/product_entity.dart';

abstract class HomeRepository {
  Future<Either<ServerFailure, List<Category>>> getCategories();
  Future<Either<ServerFailure, List<Brand>>> getBrands();
  Future<Either<ServerFailure, List<Product>>> getProducts(
      ProductsSort? sortBy);
}

enum ProductsSort {
  mostSelling("-sold"),
  lowestPrice("price"),
  highestPrice("-price");

  final String value;

  const ProductsSort(this.value);
}
