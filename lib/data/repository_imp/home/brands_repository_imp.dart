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
  Future<List<Brand>?> getBrands() {
    return brandsDataSource.getBrands();
  }
}
