import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/home/category_entity.dart';
import '../repository/categories/sub_categories_repository.dart';

@injectable
class SubCategoriesOnCategoryUseCase {
  SubCategoriesRepository subCategoriesRepository;

  @factoryMethod
  SubCategoriesOnCategoryUseCase(this.subCategoriesRepository);

  Future<Either<ServerFailure, List<Category>?>> execute(String categoryId) {
    return subCategoriesRepository.getSubCategoriesOnCategory(categoryId);
  }
}
