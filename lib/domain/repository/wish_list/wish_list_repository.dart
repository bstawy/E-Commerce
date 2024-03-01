import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../entities/wish_list/action_on_wish_list_entity.dart';
import '../../entities/wish_list/wish_list_entity.dart';

abstract class WishListRepository {
  Future<Either<ServerFailure, WishList?>> getWishList();

  Future<Either<ServerFailure, ActionOnWishListModel?>>
      removeProductFromWishList(String productId);

  Future<Either<ServerFailure, ActionOnWishListModel?>> addProductToWishList(
      String productId);
}
