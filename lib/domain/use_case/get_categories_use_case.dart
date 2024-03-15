import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/home/category_entity.dart';
import '../repository/home/home_repository.dart';

@injectable
class GetCategoriesUseCase {
  HomeRepository homeRepository;

  @factoryMethod
  GetCategoriesUseCase(this.homeRepository);

  Future<Either<ServerFailure, List<Category>?>> execute() async {
    var response = await homeRepository.getCategories();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
