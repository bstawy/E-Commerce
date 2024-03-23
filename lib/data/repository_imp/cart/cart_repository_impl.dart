import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/cart/cart_data_entity.dart';
import '../../../domain/repository/cart/cart_repository.dart';
import '../../data_source/cart/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  @factoryMethod
  CartRepositoryImpl(this.cartRemoteDataSource);

  @override
  Future<Either<ServerFailure, String>> addProduct(String productId) async {
    return await cartRemoteDataSource.addProduct(productId);
  }

  @override
  Future<Either<ServerFailure, String>> clear() async {
    return await cartRemoteDataSource.clear();
  }

  @override
  Future<Either<ServerFailure, CartData>> getProducts() async {
    return await cartRemoteDataSource.getProducts();
  }

  @override
  Future<Either<ServerFailure, CartData>> removeSpecificProduct(
      String productId) async {
    return await cartRemoteDataSource.removeSpecificProduct(productId);
  }

  @override
  Future<Either<ServerFailure, CartData>> updateProductQuantity(
      String productId, String quantity) async {
    return await cartRemoteDataSource.updateProductQuantity(
        productId, quantity);
  }
}
