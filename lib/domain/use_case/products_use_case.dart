import 'package:injectable/injectable.dart';

import '../entities/home/product_entity.dart';
import '../repository/home/products_repository.dart';

@injectable
class ProductsUseCase {
  ProductsRepository productsRepository;

  @factoryMethod
  ProductsUseCase(this.productsRepository);

  Future<List<Product>?> execute() {
    return productsRepository.getProducts(sortBy: ProductsSort.mostSelling);
  }
}
