import '../../../domain/entities/home/brand_entity.dart';

abstract class BrandsDataSource {
  Future<List<Brand>?> getBrands();
}
