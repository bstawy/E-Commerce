import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../data_source/category_products/category_products_remote_data_source.dart';

@Injectable(as: CategoryProductsRemoteDataSource)
class CategoryProductsRemoteDataSourceImpl
    extends CategoryProductsRemoteDataSource {
  ApiManager apiManager;
  HiveManager hiveManager;

  @factoryMethod
  CategoryProductsRemoteDataSourceImpl(this.apiManager, this.hiveManager);

  @override
  Future<Either<ServerFailure, List<Product>>> getCategoryProducts(
      String categoryId) async {
    var response = await apiManager.getCategoryProducts(categoryId);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      if (r.data!.isEmpty) {
        return const Right([]);
      }
      List<Product> categoryProducts =
          r.data!.map((e) => e.toProduct()).toList();

      hiveManager.cacheData<Product>(
        boxKey: HiveBoxKeys.categoryProducts,
        dataList: categoryProducts,
      );
      return Right(categoryProducts);
    });
  }
}
