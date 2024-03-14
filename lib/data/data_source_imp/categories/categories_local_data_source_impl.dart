import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/sub_category_entity.dart';
import '../../data_source/categories/categories_local_data_source.dart';

@Injectable(as: CategoriesLocalDataSource)
class CategoriesLocalDataSourceImpl extends CategoriesLocalDataSource {
  HiveManager hiveManager;

  @factoryMethod
  CategoriesLocalDataSourceImpl(this.hiveManager);

  @override
  List<Category> getCategories() {
    return hiveManager.retrieveData<Category>(HiveBoxKeys.categories);
  }

  @override
  List<SubCategory> getSubCategoriesOnCategory(String categoryId) {
    var subCategories = hiveManager
        .retrieveData<SubCategory>(HiveBoxKeys.subCategories)
        .where((subCategory) => subCategory.categoryId == categoryId)
        .toList();

    return subCategories;
  }
}
