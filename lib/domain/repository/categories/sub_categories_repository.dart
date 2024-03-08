import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../entities/home/category_entity.dart';

abstract class SubCategoriesRepository {
  Future<Either<ServerFailure, List<Category>?>> getSubCategoriesOnCategory(
      String categoryId);
}
