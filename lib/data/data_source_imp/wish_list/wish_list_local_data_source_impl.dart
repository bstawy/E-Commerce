import 'package:injectable/injectable.dart';

import '../../../core/config/constants.dart';
import '../../../core/data_services/local_storage/hive_manager.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/entities/wish_list/wish_list_entity.dart';
import '../../data_source/wish_list/wish_list_local_data_source.dart';

@Injectable(as: WishListLocalDataSource)
class WishListLocalDataSourceImpl extends WishListLocalDataSource {
  HiveManager hiveManager;

  @factoryMethod
  WishListLocalDataSourceImpl(this.hiveManager);

  @override
  WishList getWishlist() {
    WishList wishList =
        WishList(data: hiveManager.retrieveData<Product>(HiveBoxKeys.wishList));
    return wishList;
  }
}
