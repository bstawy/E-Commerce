import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/repository/home/products_repository.dart';
import '../../data_source/home/products_data_source.dart';

@Injectable(as: ProductsDataSource)
class ProductsOnlineDataSource extends ProductsDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductsOnlineDataSource(this.apiManager);

  @override
  Future<Either<ServerFailure, List<Product>?>> getProducts(
      {ProductsSort? sortBy}) async {
    var response = await apiManager.getProducts(sortBy: sortBy);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(
          r.data?.map((productDto) => productDto.toProduct()).toList());
    });
  }
}
