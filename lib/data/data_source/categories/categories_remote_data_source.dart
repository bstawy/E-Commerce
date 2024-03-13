import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/sub_category_entity.dart';

abstract class CategoriesRemoteDataSource {
  Future<Either<ServerFailure, List<Category>>> getCategories();
  Future<Either<ServerFailure, List<SubCategory>>> getSubCategoriesOnCategory(
      String categoryId);
}
