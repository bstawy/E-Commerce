import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../core/error/server_failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../data_source/auth/register_data_source.dart';
import '../../models/requests/register_request.dart';

@Injectable(as: RegisterDataSource)
class RegisterDataSourceImp extends RegisterDataSource {
  ApiManager apiManager;

  @factoryMethod
  RegisterDataSourceImp(this.apiManager);

  @override
  Future<Either<ServerFailure, User?>> register(
      RegisterRequest userCredentials) async {
    var response = await apiManager.register(userCredentials);

    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toUser());
    });
  }
}
