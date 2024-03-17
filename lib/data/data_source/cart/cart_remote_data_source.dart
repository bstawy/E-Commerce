import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/cart/cart_data_entity.dart';

abstract class CartRemoteDataSource {
  Future<Either<ServerFailure, CartData>> getProducts();

  Future<Either<ServerFailure, String>> addProduct(String productId);

  Future<Either<ServerFailure, CartData>> updateProductQuantity(
      String productId, String quantity);

  Future<Either<ServerFailure, CartData>> removeSpecificProduct(
      String productId);

  Future<Either<ServerFailure, String>> clear();
}
