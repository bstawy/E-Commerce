import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/repository/home/categories_repository.dart';
import '../../data_source/home/categories_data_source.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImp extends CategoriesRepository {
  CategoriesDataSource onlineDataSource;

  @factoryMethod
  CategoriesRepositoryImp(this.onlineDataSource);

  @override
  Future<List<Category>?> getCategories() {
    return onlineDataSource.getCategories();
  }
}
