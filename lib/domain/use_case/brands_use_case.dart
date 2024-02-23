import 'package:injectable/injectable.dart';

import '../entities/home/brand_entity.dart';
import '../repository/home/brands_repository.dart';

@injectable
class BrandsUseCase {
  BrandsRepository brandsRepository;

  @factoryMethod
  BrandsUseCase(this.brandsRepository);

  Future<List<Brand>?> execute() {
    return brandsRepository.getBrands();
  }
}
