import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/home/brands_response/brands_response.dart';
import '../../data/models/home/categories_response/categories_response.dart';
import '../config/constants.dart';

@singleton
@injectable
class ApiManager {
  late Dio dio;

  ApiManager() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 2),
      receiveTimeout: const Duration(seconds: 2),
    );
    dio = Dio(options);
  }

  Future<CategoriesResponse> getCategories() async {
    Response response = await dio.get(EndPoints.allCategories);

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}${EndPoints.allCategories} ==");
    debugPrint("===================================================");

    CategoriesResponse allCategories =
        CategoriesResponse.fromJson(response.data);

    debugPrint("==================== Api Response ====================");
    debugPrint("== ${allCategories.results ?? "null"} ==");
    debugPrint("===================================================");
    debugPrint("${allCategories.results}");

    return allCategories;
  }

  Future<BrandsResponse> getBrands() async {
    Response response = await dio.get(EndPoints.allBrands);

    debugPrint("==================== Api Call ====================");
    debugPrint("== URL Request: ${Constants.baseUrl}${EndPoints.allBrands} ==");
    debugPrint("===================================================");

    BrandsResponse allBrands = BrandsResponse.fromJson(response.data);

    debugPrint("==================== Api Response ====================");
    debugPrint("== ${allBrands.results ?? "null"} ==");
    debugPrint("===================================================");
    debugPrint("${allBrands.results}");

    return allBrands;
  }
}
