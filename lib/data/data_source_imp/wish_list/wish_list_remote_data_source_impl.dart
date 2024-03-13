import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/wish_list/action_on_wish_list_entity.dart';
import '../../../domain/entities/wish_list/wish_list_entity.dart';
import '../../data_source/wish_list/wish_list_remote_data_source.dart';

@Injectable(as: WishListRemoteDataSource)
class WishListRemoteDataSourceImpl extends WishListRemoteDataSource {
  ApiManager apiManager;

  @factoryMethod
  WishListRemoteDataSourceImpl(this.apiManager);

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

  @override
  Future<Either<ServerFailure, ActionOnWishListModel>>
      removeProductFromWishList(String productId) async {
    var response = await apiManager.removeProductFromWishList(productId);

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r.toActionOnWishList());
      },
    );
  }

  @override
  Future<Either<ServerFailure, ActionOnWishListModel>> addProductToWishList(
      String productId) async {
    var response = await apiManager.addProductToWishList(productId);

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r.toActionOnWishList());
      },
    );
  }
}
