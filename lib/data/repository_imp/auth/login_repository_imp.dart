import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/repository/auth/login_repository.dart';
import '../../data_source/auth/login_data_source.dart';
import '../../models/requests/login_request.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp extends LoginRepository {
  LoginDataSource loginDataSource;

  @factoryMethod
  LoginRepositoryImp(this.loginDataSource);

  @override
  Future<Either<ServerFailure, User?>> login(
      LoginRequest userCredentials) async {
    var response = await loginDataSource.login(userCredentials);
    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
