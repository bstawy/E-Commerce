import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/repository/auth/register_repository.dart';
import '../../data_source/auth/register_data_source.dart';
import '../../models/requests/register_request.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImp extends RegisterRepository {
  RegisterDataSource registerDataSource;

  @factoryMethod
  RegisterRepositoryImp(this.registerDataSource);

  @override
  Future<Either<ServerFailure, User?>> register(
      RegisterRequest userCredentials) async {
    var response = await registerDataSource.register(userCredentials);
    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
