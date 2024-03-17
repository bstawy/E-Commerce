import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/cart/cart_data_entity.dart';
import '../../data_source/cart/cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  ApiManager apiManager;

  @factoryMethod
  CartRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<ServerFailure, String>> addProduct(String productId) async {
    var response = await apiManager.addProductToCart(productId);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<ServerFailure, String>> clear() async {
    var response = await apiManager.clearCart();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<ServerFailure, CartData>> getProducts() async {
    var response = await apiManager.getCartProducts();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.data!.toCartData()),
    );
  }

  @override
  Future<Either<ServerFailure, CartData>> removeSpecificProduct(
      String productId) async {
    var response = await apiManager.removeSpecificProductFromCart(productId);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.data!.toCartData()),
    );
  }

  @override
  Future<Either<ServerFailure, CartData>> updateProductQuantity(
      String productId, String quantity) async {
    var response =
        await apiManager.updateProductQuantityInCart(productId, quantity);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.data!.toCartData()),
    );
  }
}
