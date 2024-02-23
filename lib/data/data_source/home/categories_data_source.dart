import '../../../domain/entities/home/category_entity.dart';

abstract class CategoriesDataSource {
  Future<List<Category>?> getCategories();
}
