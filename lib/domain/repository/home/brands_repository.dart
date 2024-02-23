import '../../entities/home/brand_entity.dart';

abstract class BrandsRepository {
  Future<List<Brand>?> getBrands();
}
