import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/home/product_entity.dart';
import '../repository/category_products/category_products_repository.dart';

@injectable
class GetCategoryProductsUseCase {
  CategoryProductsRepository categoryProductsRepository;

  @factoryMethod
  GetCategoryProductsUseCase(this.categoryProductsRepository);

  Future<Either<ServerFailure, List<Product>?>> execute(
      String categoryId) async {
    var response =
        await categoryProductsRepository.getCategoryProducts(categoryId);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
