import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/wish_list/wish_list_entity.dart';
import '../repository/wish_list/wish_list_repository.dart';

@injectable
class GetWishListUseCase {
  WishListRepository wishListRepository;

  @factoryMethod
  GetWishListUseCase(this.wishListRepository);

  Future<Either<ServerFailure, WishList?>> execute() async {
    var response = await wishListRepository.getWishList();

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
