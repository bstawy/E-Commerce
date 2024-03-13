import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/sub_category_entity.dart';
import '../../data_source/categories/categories_remote_data_source.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  ApiManager apiManager;
  HiveManager hiveManager;

  @factoryMethod
  CategoriesRemoteDataSourceImpl(this.apiManager, this.hiveManager);

  @override
  Future<Either<ServerFailure, List<Category>>> getCategories() async {
    var response = await apiManager.getCategories();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      List<Category> categories = r.data!.map((e) => e.toCategory()).toList();

      hiveManager.cacheData<Category>(
        boxKey: HiveBoxKeys.categories,
        dataList: categories,
      );

      return Right(categories);
    });
  }

  @override
  Future<Either<ServerFailure, List<SubCategory>>> getSubCategoriesOnCategory(
      String categoryId) async {
    var response = await apiManager.getSubCategoriesOnCategoryId(categoryId);

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        if (r.data!.isEmpty) {
          return const Right([]);
        }
        List<SubCategory> subCategories =
            r.data!.map((e) => e.toSubCategory()).toList();

        hiveManager.cacheData<SubCategory>(
          boxKey: HiveBoxKeys.subCategories,
          dataList: subCategories,
        );

        return Right(subCategories);
      },
    );
  }
}
