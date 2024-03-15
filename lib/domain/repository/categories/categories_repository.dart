import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/home/category_entity.dart';
import '../../entities/home/sub_category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<ServerFailure, List<Category>?>> getCategories();
  Future<Either<ServerFailure, List<SubCategory>?>> getSubCategoriesOnCategory(
      String categoryId);
}
