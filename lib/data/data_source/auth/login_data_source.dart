import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../models/requests/login_request.dart';

abstract class LoginDataSource {
  Future<Either<ServerFailure, User?>> login(LoginRequest userCredentials);
}
