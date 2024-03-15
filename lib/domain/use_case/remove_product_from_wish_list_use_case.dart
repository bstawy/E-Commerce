import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/wish_list/action_on_wish_list_entity.dart';
import '../repository/wish_list/wish_list_repository.dart';

@injectable
class RemoveProductFromWishListUseCase {
  WishListRepository wishListRepository;

  @factoryMethod
  RemoveProductFromWishListUseCase(this.wishListRepository);

  Future<Either<ServerFailure, ActionOnWishListModel?>> execute(
      String productId) async {
    var response =
        await wishListRepository.removeProductFromWishList(productId);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
