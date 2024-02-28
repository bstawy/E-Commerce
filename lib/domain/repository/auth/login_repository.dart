import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../data/models/requests/login_request.dart';
import '../../entities/auth/user_entity.dart';

abstract class LoginRepository {
  Future<Either<ServerFailure, User?>> login(LoginRequest userCredentials);
}
