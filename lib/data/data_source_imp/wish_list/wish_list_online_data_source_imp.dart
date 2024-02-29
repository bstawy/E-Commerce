import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/wish_list/wish_list_entity.dart';
import '../../data_source/wish_list/wish_list_data_source.dart';

@Injectable(as: WishListDataSource)
class WishListOnlineDataSourceImp extends WishListDataSource {
  ApiManager apiManager;

  @factoryMethod
  WishListOnlineDataSourceImp(this.apiManager);

  @override
  Future<Either<ServerFailure, WishList>> getWishList() async {
    var response = await apiManager.getWishList();

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(WishList(
            data:
                r.data?.map((productDto) => productDto.toProduct()).toList()));
      },
    );
  }
}
