import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/server_failure.dart';
import '../../data/models/requests/login_request.dart';
import '../entities/auth/user_entity.dart';
import '../repository/auth/login_repository.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;

  @factoryMethod
  LoginUseCase(this.loginRepository);

  Future<Either<ServerFailure, User?>> execute(
      LoginRequest userCredentials) async {
    return loginRepository.login(userCredentials);
  }
}
