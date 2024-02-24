import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/products_repository.dart';

abstract class ProductsDataSource {
  Future<List<Product>?> getProducts({ProductsSort? sortBy});
}
