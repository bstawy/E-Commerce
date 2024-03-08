import 'package:dartz/dartz.dart';
import '../../../core/error/server_failure.dart';

import '../../../domain/entities/home/brand_entity.dart';

abstract class BrandsDataSource {
  Future<Either<ServerFailure, List<Brand>?>> getBrands();
}
