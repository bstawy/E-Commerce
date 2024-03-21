import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../repository/cart/cart_repository.dart';

@injectable
class AddProductToCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  AddProductToCartUseCase(this.cartRepository);

  Future<Either<ServerFailure, String>> execute(String productId) async {
    return await cartRepository.addProduct(productId);
  }
}
