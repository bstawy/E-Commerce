import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../repository/cart/cart_repository.dart';

@injectable
class ClearCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  ClearCartUseCase(this.cartRepository);

  Future<Either<ServerFailure, String>> execute() async {
    return await cartRepository.clear();
  }
}
