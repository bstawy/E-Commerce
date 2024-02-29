import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/wish_list/wish_list_entity.dart';

abstract class WishListDataSource {
  Future<Either<ServerFailure, WishList?>> getWishList();
}
