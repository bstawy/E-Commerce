import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../data_source/home/home_local_data_source.dart';

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  HiveManager hiveManager;

  @factoryMethod
  HomeLocalDataSourceImpl(this.hiveManager);

  @override
  List<Brand> getBrands() {
    return hiveManager.retrieveData<Brand>(HiveBoxKeys.homeBrands);
  }

  @override
  List<Category> getCategories() {
    return hiveManager.retrieveData<Category>(HiveBoxKeys.homeCategories);
  }

  @override
  List<Product> getProducts() {
    return hiveManager.retrieveData<Product>(HiveBoxKeys.homeProducts);
  }
}
