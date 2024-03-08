import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../data_source/home/categories_data_source.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesOnlineDataSourceImp extends CategoriesDataSource {
  ApiManager apiManager;

  @factoryMethod
  CategoriesOnlineDataSourceImp(this.apiManager);

  @override
  Future<Either<ServerFailure, List<Category>?>> getCategories() async {
    var response = await apiManager.getCategories();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(
          r.data?.map((categoryDto) => categoryDto.toCategory()).toList());
    });
  }
}
