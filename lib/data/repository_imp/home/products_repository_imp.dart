import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/products_repository.dart';
import '../../data_source/home/products_data_source.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImp extends ProductsRepository {
  ProductsDataSource productsDataSource;

  @factoryMethod
  ProductsRepositoryImp(this.productsDataSource);

  @override
  Future<List<Product>?> getProducts({ProductsSort? sortBy}) {
    return productsDataSource.getProducts(sortBy: sortBy);
  }
}
