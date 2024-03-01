import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/wish_list/action_on_wish_list_entity.dart';
import '../../../domain/entities/wish_list/wish_list_entity.dart';
import '../../../domain/repository/wish_list/wish_list_repository.dart';
import '../../data_source/wish_list/wish_list_data_source.dart';

@Injectable(as: WishListRepository)
class WishListRepositoryImp extends WishListRepository {
  WishListDataSource wishListDataSource;

  @factoryMethod
  WishListRepositoryImp(this.wishListDataSource);

  @override
  Future<Either<ServerFailure, WishList?>> getWishList() {
    return wishListDataSource.getWishList();
  }

  @override
  Future<Either<ServerFailure, ActionOnWishListModel?>>
      removeProductFromWishList(String productId) {
    return wishListDataSource.removeProductFromWishList(productId);
  }

  @override
  Future<Either<ServerFailure, ActionOnWishListModel?>> addProductToWishList(
      String productId) {
    return wishListDataSource.addProductToWishList(productId);
  }
}
