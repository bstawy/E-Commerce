import 'package:dartz/dartz.dart';
import '../../core/error/server_failure.dart';
import 'package:injectable/injectable.dart';

import '../entities/home/product_entity.dart';
import '../repository/home/products_repository.dart';

@injectable
class ProductsUseCase {
  ProductsRepository productsRepository;

  @factoryMethod
  ProductsUseCase(this.productsRepository);

  Future<Either<ServerFailure, List<Product>?>> execute() {
    return productsRepository.getProducts(sortBy: ProductsSort.mostSelling);
  }
}
