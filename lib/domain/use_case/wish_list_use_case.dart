import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/wish_list/wish_list_entity.dart';
import '../repository/wish_list/wish_list_repository.dart';

@injectable
class WishListUseCase {
  WishListRepository wishListRepository;

  @factoryMethod
  WishListUseCase(this.wishListRepository);

  Future<Either<ServerFailure, WishList?>> execute() {
    return wishListRepository.getWishList();
  }
}
