import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../data/models/auth/auth_response.dart';
import '../../../data/models/home/brands_response/brands_response.dart';
import '../../../data/models/home/categories_response/categories_response.dart';
import '../../../data/models/home/products_response/products_response.dart';
import '../../../data/models/requests/login_request.dart';
import '../../../data/models/requests/register_request.dart';
import '../../../data/models/wish_list_response/wish_list_response.dart';
import '../../../domain/repository/home/products_repository.dart';
import '../../config/constants.dart';
import '../../di/di.dart';
import '../../error/server_failure.dart';
import '../local_storage/local_token_manager.dart';

@singleton
@injectable
class ApiManager {
  // ===================== Authentication =====================
  Future<Either<ServerFailure, AuthResponse>> register(
      RegisterRequest userCredentials) async {
    debugPrint("==================== Request Body ====================");
    debugPrint("== ${userCredentials.fullName} ==");
    debugPrint("== ${userCredentials.email} ==");
    debugPrint("== ${userCredentials.mobilePhone} ==");
    debugPrint("== ${userCredentials.password} ==");
    debugPrint("== ${userCredentials.confirmPassword} ==");
    debugPrint("===================================================");

    Uri url = Uri.https(Constants.baseUrl, EndPoints.register);
    http.Response response = await http.post(
      url,
      headers: Constants.headers,
      body: jsonEncode(userCredentials.toJson()),
    );

    if (response.statusCode == 200) {
      AuthResponse registerResponse =
          AuthResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${registerResponse.message} ==");
      debugPrint("== ${registerResponse.user} ==");
      debugPrint("== ${registerResponse.token} ==");
      debugPrint("===================================================");

      return Right(registerResponse);
    } else {
      ServerFailure serverFailure = ServerFailure.fromJson(
          response.statusCode, jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${serverFailure.statusCode} ==");
      debugPrint("== ${serverFailure.statusMsg} ==");
      debugPrint("== ${serverFailure.message} ==");
      debugPrint("===================================================");

      return Left(serverFailure);
    }
  }

  Future<Either<ServerFailure, AuthResponse>> login(
      LoginRequest userCredentials) async {
    debugPrint("==================== Request Body ====================");
    debugPrint("== ${userCredentials.email} ==");
    debugPrint("== ${userCredentials.password} ==");
    debugPrint("===================================================");

    Uri url = Uri.https(Constants.baseUrl, EndPoints.login);
    http.Response response = await http.post(
      url,
      headers: Constants.headers,
      body: jsonEncode(userCredentials.toJson()),
    );

    if (response.statusCode == 200) {
      AuthResponse loginResponse =
          AuthResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${loginResponse.message} ==");
      debugPrint("== ${loginResponse.user} ==");
      debugPrint("== ${loginResponse.token} ==");
      debugPrint("===================================================");

      return Right(loginResponse);
    } else {
      ServerFailure serverFailure = ServerFailure.fromJson(
          response.statusCode, jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${serverFailure.statusCode} ==");
      debugPrint("== ${serverFailure.statusMsg} ==");
      debugPrint("== ${serverFailure.message} ==");
      debugPrint("===================================================");

      return Left(serverFailure);
    }
  }

  // ===================== Data =====================

  Future<CategoriesResponse> getCategories() async {
    Uri url = Uri.https(Constants.baseUrl, EndPoints.allCategories);
    http.Response response = await http.get(url);

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}${EndPoints.allCategories} ==");
    debugPrint("===================================================");

    CategoriesResponse allCategories =
        CategoriesResponse.fromJson(jsonDecode(response.body));

    debugPrint("==================== Api Response ====================");
    debugPrint("== ${allCategories.results ?? "null"} ==");
    debugPrint("===================================================");
    debugPrint("${allCategories.results}");

    return allCategories;
  }

  Future<BrandsResponse> getBrands() async {
    Uri url = Uri.https(Constants.baseUrl, EndPoints.allBrands);
    http.Response response = await http.get(url);

    debugPrint("==================== Api Call ====================");
    debugPrint("== URL Request: ${Constants.baseUrl}${EndPoints.allBrands} ==");
    debugPrint("===================================================");

    BrandsResponse allBrands =
        BrandsResponse.fromJson(jsonDecode(response.body));

    debugPrint("==================== Api Response ====================");
    debugPrint("== ${allBrands.results ?? "null"} ==");
    debugPrint("===================================================");
    debugPrint("${allBrands.results}");

    return allBrands;
  }

  Future<ProductsResponse> getProducts({ProductsSort? sortBy}) async {
    Map<String, dynamic>? params = {};
    http.Response response;

    if (sortBy != null) {
      params['sort'] = sortBy.value;
      Uri url = Uri.https(Constants.baseUrl, EndPoints.allProducts, params);
      response = await http.get(url);
    } else {
      Uri url = Uri.https(Constants.baseUrl, EndPoints.allProducts);
      response = await http.get(url);
    }

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}${EndPoints.allProducts} ==");
    debugPrint("===================================================");

    ProductsResponse allProducts =
        ProductsResponse.fromJson(jsonDecode(response.body));

    debugPrint("==================== Api Response ====================");
    debugPrint("== ${allProducts.results ?? "null"} ==");
    debugPrint("===================================================");
    debugPrint("${allProducts.results}");

    return allProducts;
  }

  Future<Either<ServerFailure, WishListResponse>> getWishList() async {
    String? token = await getIt<LocalTokenManager>().getToken();

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");

    Uri url = Uri.https(Constants.baseUrl, EndPoints.wishList);
    http.Response response =
        await http.get(url, headers: {'token': token ?? ""});

    if (response.statusCode == 200) {
      WishListResponse wishListResponse =
          WishListResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${wishListResponse.status} ==");
      debugPrint("== ${wishListResponse.count} ==");
      debugPrint("== ${wishListResponse.data} ==");
      debugPrint("===================================================");

      return Right(wishListResponse);
    } else {
      ServerFailure serverFailure = ServerFailure.fromJson(
          response.statusCode, jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${serverFailure.statusCode} ==");
      debugPrint("== ${serverFailure.statusMsg} ==");
      debugPrint("== ${serverFailure.message} ==");
      debugPrint("===================================================");

      return Left(serverFailure);
    }
  }
}
