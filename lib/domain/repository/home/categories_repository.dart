import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../entities/home/category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<ServerFailure, List<Category>?>> getCategories();
}
