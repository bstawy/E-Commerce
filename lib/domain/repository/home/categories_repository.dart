import '../../entities/home/category_entity.dart';

abstract class CategoriesRepository {
  Future<List<Category>?> getCategories();
}
