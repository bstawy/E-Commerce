import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../../data/models/requests/register_request.dart';
import '../entities/auth/user_entity.dart';
import '../repository/auth/register_repository.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository;

  @factoryMethod
  RegisterUseCase(this.registerRepository);

  Future<Either<ServerFailure, User?>> execute(
      RegisterRequest userCredentials) async {
    return registerRepository.register(userCredentials);
  }
}
