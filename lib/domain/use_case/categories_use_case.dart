import 'package:dartz/dartz.dart';
import '../../core/error/server_failure.dart';
import 'package:injectable/injectable.dart';

import '../entities/home/category_entity.dart';
import '../repository/home/categories_repository.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepository repository;

  @factoryMethod
  CategoriesUseCase(this.repository);

  Future<Either<ServerFailure, List<Category>?>> execute() {
    return repository.getCategories();
  }
}
