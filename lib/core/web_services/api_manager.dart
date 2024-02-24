import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/home/brands_response/brands_response.dart';
import '../../data/models/home/categories_response/categories_response.dart';
import '../../data/models/home/products_response/products_response.dart';
import '../../domain/repository/home/products_repository.dart';
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

  Future<ProductsResponse> getProducts({ProductsSort? sortBy}) async {
    Map<String, dynamic>? params = {};
    Response response;

    if (sortBy != null) {
      params['sort'] = sortBy.value;
      response = await dio.get(EndPoints.allProducts, queryParameters: params);
    } else {
      response = await dio.get(EndPoints.allProducts);
    }

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}${EndPoints.allProducts} ==");
    debugPrint("===================================================");

    ProductsResponse allProducts = ProductsResponse.fromJson(response.data);

    debugPrint("==================== Api Response ====================");
    debugPrint("== ${allProducts.results ?? "null"} ==");
    debugPrint("===================================================");
    debugPrint("${allProducts.results}");

    return allProducts;
  }
}
