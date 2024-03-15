import '../../../domain/entities/home/product_entity.dart';

abstract class CategoryProductsLocalDataSource {
  List<Product> getCategoryProducts(String categoryId);
}
