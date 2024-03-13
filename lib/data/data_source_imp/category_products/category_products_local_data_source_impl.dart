import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/product_entity.dart';
import '../../data_source/category_products/category_products_local_data_source.dart';

@Injectable(as: CategoryProductsLocalDataSource)
class CategoryProductsLocalDataSourceImpl
    extends CategoryProductsLocalDataSource {
  // TODO: open Box
  @override
  List<Product> getCategoryProducts(String categoryId) {
    // TODO: implement getCategoryProducts
    throw UnimplementedError();
  }
}
