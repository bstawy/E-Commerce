import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../entities/cart/cart_data_entity.dart';
import '../repository/cart/cart_repository.dart';

@injectable
class UpdateCartProductQuantityUseCase {
  CartRepository cartRepository;

  @factoryMethod
  UpdateCartProductQuantityUseCase(this.cartRepository);

  Future<Either<ServerFailure, CartData>> execute({
    required String productId,
    required String quantity,
  }) async {
    return await cartRepository.updateProductQuantity(productId, quantity);
  }
}
