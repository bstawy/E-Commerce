import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/home/product_entity.dart';
import '../repository/home/home_repository.dart';

@injectable
class GetMostSellingProductsUseCase {
  HomeRepository homeRepository;

  @factoryMethod
  GetMostSellingProductsUseCase(this.homeRepository);

  Future<Either<ServerFailure, List<Product>?>> execute() async {
    var response = await homeRepository.getProducts(ProductsSort.mostSelling);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
