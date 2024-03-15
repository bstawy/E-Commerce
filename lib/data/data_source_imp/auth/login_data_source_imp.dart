import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../data_source/auth/login_data_source.dart';
import '../../models/requests/login_request.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImp extends LoginDataSource {
  ApiManager apiManager;

  @factoryMethod
  LoginDataSourceImp(this.apiManager);

  @override
  Future<Either<ServerFailure, User?>> login(
      LoginRequest userCredentials) async {
    var response = await apiManager.login(userCredentials);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toUser());
    });
  }
}
