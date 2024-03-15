import "package:dartz/dartz.dart";

import "../../../core/error/server_failure.dart";
import "../../../data/models/requests/register_request.dart";
import "../../entities/auth/user_entity.dart";

abstract class RegisterRepository {
  Future<Either<ServerFailure, User?>> register(
      RegisterRequest userCredentials);
}
