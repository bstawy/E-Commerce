import 'package:injectable/injectable.dart';

import '../../../core/data_services/web_services/api_manager.dart';
import '../../../domain/entities/home/brand_entity.dart';
import '../../data_source/home/brands_data_source.dart';

@Injectable(as: BrandsDataSource)
class OnlineBrandsDataSourceImp extends BrandsDataSource {
  ApiManager apiManager;

  @factoryMethod
  OnlineBrandsDataSourceImp(this.apiManager);

  @override
  Future<List<Brand>?> getBrands() async {
    var response = await apiManager.getBrands();

    return response.data?.map((brandDto) => brandDto.toBrand()).toList();
  }
}
