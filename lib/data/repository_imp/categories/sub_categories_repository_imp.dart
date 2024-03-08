import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/repository/categories/sub_categories_repository.dart';
import '../../data_source/categories/sub_categories_data_source.dart';

@Injectable(as: SubCategoriesRepository)
class SubCategoriesRepositoryImp extends SubCategoriesRepository {
  SubCategoriesDataSource subCategoriesDataSource;

  @factoryMethod
  SubCategoriesRepositoryImp(this.subCategoriesDataSource);

  @override
  Future<Either<ServerFailure, List<Category>?>> getSubCategoriesOnCategory(
      String categoryId) async {
    var response =
        await subCategoriesDataSource.getSubCategoriesOnCategory(categoryId);

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
