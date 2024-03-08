import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/repository/home/brands_repository.dart';
import '../../data_source/home/brands_data_source.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImp extends BrandsRepository {
  BrandsDataSource brandsDataSource;

  @factoryMethod
  BrandsRepositoryImp(this.brandsDataSource);

  @override
  Future<Either<ServerFailure, List<Brand>?>> getBrands() async {
    var response = await brandsDataSource.getBrands();

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
