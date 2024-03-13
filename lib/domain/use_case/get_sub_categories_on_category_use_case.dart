import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/home/sub_category_entity.dart';
import '../repository/categories/categories_repository.dart';

@injectable
class GetSubCategoriesOnCategoryUseCase {
  CategoriesRepository categoriesRepository;

  @factoryMethod
  GetSubCategoriesOnCategoryUseCase(this.categoriesRepository);

  Future<Either<ServerFailure, List<SubCategory>?>> execute(
      String categoryId) async {
    var response =
        await categoriesRepository.getSubCategoriesOnCategory(categoryId);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
