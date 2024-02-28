import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../models/requests/register_request.dart';

abstract class RegisterDataSource {
  Future<Either<ServerFailure, User?>> register(
      RegisterRequest userCredentials);
}
