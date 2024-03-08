import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/repository/home/categories_repository.dart';
import '../../data_source/home/categories_data_source.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImp extends CategoriesRepository {
  CategoriesDataSource categoriesOnlineDataSource;

  @factoryMethod
  CategoriesRepositoryImp(this.categoriesOnlineDataSource);

  @override
  Future<Either<ServerFailure, List<Category>?>> getCategories() async {
    var response = await categoriesOnlineDataSource.getCategories();

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
