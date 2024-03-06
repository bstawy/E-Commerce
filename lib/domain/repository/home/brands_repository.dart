import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/server_failure.dart';

import '../../entities/home/brand_entity.dart';

abstract class BrandsRepository {
  Future<Either<ServerFailure, List<Brand>?>> getBrands();
}
