import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/home/brand_entity.dart';
import '../repository/home/home_repository.dart';

@injectable
class GetBrandsUseCase {
  HomeRepository homeRepository;

  @factoryMethod
  GetBrandsUseCase(this.homeRepository);

  Future<Either<ServerFailure, List<Brand>?>> execute() async {
    var response = await homeRepository.getBrands();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
