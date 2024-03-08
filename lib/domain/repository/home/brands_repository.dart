import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';

import '../../entities/home/brand_entity.dart';

abstract class BrandsRepository {
  Future<Either<ServerFailure, List<Brand>?>> getBrands();
}
