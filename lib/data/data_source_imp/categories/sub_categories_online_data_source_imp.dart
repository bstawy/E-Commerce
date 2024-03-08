import 'package:dartz/dartz.dart';
import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../data_source/categories/sub_categories_data_source.dart';
import '../../../domain/entities/home/category_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesDataSource)
class SubCategoriesOnlineDataSourceImp extends SubCategoriesDataSource {
  ApiManager apiManager;

  @factoryMethod
  SubCategoriesOnlineDataSourceImp(this.apiManager);

  @override
  Future<Either<ServerFailure, List<Category>?>> getSubCategoriesOnCategory(
      String categoryId) async {
    var response = await apiManager.getSubCategoriesOnCategoryId(categoryId);

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(
          r.data!.isEmpty
              ? []
              : r.data?.map((categoryDto) => categoryDto.toCategory()).toList(),
        );
      },
    );
  }
}
