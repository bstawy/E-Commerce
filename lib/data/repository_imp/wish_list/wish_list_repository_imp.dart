import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/wish_list/action_on_wish_list_entity.dart';
import '../../../domain/entities/wish_list/wish_list_entity.dart';
import '../../../domain/repository/wish_list/wish_list_repository.dart';
import '../../data_source/wish_list/wish_list_local_data_source.dart';
import '../../data_source/wish_list/wish_list_remote_data_source.dart';

@Injectable(as: WishListRepository)
class WishListRepositoryImp extends WishListRepository {
  WishListRemoteDataSource wishListRemoteDataSource;
  WishListLocalDataSource wishListLocalDataSource;

  @factoryMethod
  WishListRepositoryImp(
      this.wishListRemoteDataSource, this.wishListLocalDataSource);

  @override
  Future<Either<ServerFailure, WishList?>> getWishList() async {
    WishList wishList = wishListLocalDataSource.getWishlist();
    if (wishList.data!.isNotEmpty) {
      return Right(wishList);
    }
    return wishListRemoteDataSource.getWishList();
  }

  @override
  Future<Either<ServerFailure, ActionOnWishListModel?>>
      removeProductFromWishList(String productId) {
    return wishListRemoteDataSource.removeProductFromWishList(productId);
  }

  @override
  Future<Either<ServerFailure, ActionOnWishListModel?>> addProductToWishList(
      String productId) {
    return wishListRemoteDataSource.addProductToWishList(productId);
  }
}
