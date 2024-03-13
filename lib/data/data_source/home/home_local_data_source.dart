import "../../../domain/entities/home/brand_entity.dart";
import "../../../domain/entities/home/category_entity.dart";
import "../../../domain/entities/home/product_entity.dart";

abstract class HomeLocalDataSource {
  List<Category> getCategories();
  List<Brand> getBrands();
  List<Product> getProducts();
}
