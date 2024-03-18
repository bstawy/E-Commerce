import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../data_source/category_products/category_products_local_data_source.dart';

@Injectable(as: CategoryProductsLocalDataSource)
class CategoryProductsLocalDataSourceImpl
    extends CategoryProductsLocalDataSource {
  HiveManager hiveManager;

  CategoryProductsLocalDataSourceImpl(this.hiveManager);

  @override
  List<Product> getCategoryProducts(String categoryId) {
    var products = hiveManager
        .retrieveData<Product>(HiveBoxKeys.categoryProducts)
        .where((product) => product.subcategory!.contains(categoryId))
        .toList();

    return products;
  }
}
