import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/entities/home/sub_category_entity.dart';
import '../../config/constants.dart';

@singleton
@injectable
class HiveManager {
  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openHiveBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(BrandAdapter());
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(SubCategoryAdapter());
  }

  Future<void> _openHiveBoxes() async {
    await Hive.openBox<Category>(HiveBoxKeys.homeCategories);
    await Hive.openBox<Brand>(HiveBoxKeys.homeBrands);
    await Hive.openBox<Product>(HiveBoxKeys.homeProducts);
    await Hive.openBox<Category>(HiveBoxKeys.categories);
    await Hive.openBox<SubCategory>(HiveBoxKeys.subCategories);
    await Hive.openBox<Product>(HiveBoxKeys.categoryProducts);
    await Hive.openBox<Product>(HiveBoxKeys.wishList);
  }

  void cacheData<T>(
      {required String boxKey, List<T>? dataList, T? dataItem}) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
      box.add(dataItem);
    }
  }

  List<T> retrieveData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);

    return box.values.toList();
  }
}
