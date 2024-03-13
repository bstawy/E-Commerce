import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/sub_category_entity.dart';

abstract class CategoriesLocalDataSource {
  List<Category> getCategories();
  List<SubCategory> getSubCategoriesOnCategory(String categoryId);
}
