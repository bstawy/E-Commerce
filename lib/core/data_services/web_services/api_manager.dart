import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../data/models/auth/auth_response.dart';
import '../../../data/models/cart/cart_response.dart';
import '../../../data/models/categories/sub_categories_response.dart';
import '../../../data/models/home/brands_response/brands_response.dart';
import '../../../data/models/home/categories_response/categories_response.dart';
import '../../../data/models/home/products_response/products_response.dart';
import '../../../data/models/requests/login_request.dart';
import '../../../data/models/requests/register_request.dart';
import '../../../data/models/wish_list_response/action_on_wish_list_response.dart';
import '../../../data/models/wish_list_response/wish_list_response.dart';
import '../../../domain/repository/home/home_repository.dart';
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

    Map<String, String> headers = {"Content-Type": "application/json"};

    Uri url = Uri.https(Constants.baseUrl, EndPoints.register);
    http.Response response = await http.post(
      url,
      headers: headers,
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

    Map<String, String> headers = {"Content-Type": "application/json"};

    Uri url = Uri.https(Constants.baseUrl, EndPoints.login);
    http.Response response = await http.post(
      url,
      headers: headers,
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

  Future<Either<ServerFailure, CategoriesResponse>> getCategories() async {
    Uri url = Uri.https(Constants.baseUrl, EndPoints.allCategories);
    http.Response response = await http.get(url);

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}${EndPoints.allCategories} ==");
    debugPrint("===================================================");

    if (response.statusCode == 200) {
      CategoriesResponse subCategories =
          CategoriesResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Api Response ====================");
      debugPrint("== ${subCategories.results ?? "null"} ==");
      debugPrint("===================================================");
      return Right(subCategories);
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

  Future<Either<ServerFailure, SubCategoriesResponse>>
      getSubCategoriesOnCategoryId(String categoryId) async {
    Uri url = Uri.https(Constants.baseUrl,
        "${EndPoints.allCategories}/$categoryId${EndPoints.subCategoriesOnCategory}");
    http.Response response = await http.get(url);

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}/$categoryId${EndPoints.subCategoriesOnCategory} ==");
    debugPrint("===================================================");

    if (response.statusCode == 200) {
      SubCategoriesResponse subCategories =
          SubCategoriesResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Api Response ====================");
      debugPrint("== ${subCategories.results ?? "null"} ==");
      debugPrint("===================================================");
      return Right(subCategories);
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

  Future<Either<ServerFailure, BrandsResponse>> getBrands() async {
    Uri url = Uri.https(Constants.baseUrl, EndPoints.allBrands);
    http.Response response = await http.get(url);

    debugPrint("==================== Api Call ====================");
    debugPrint("== URL Request: ${Constants.baseUrl}${EndPoints.allBrands} ==");
    debugPrint("===================================================");

    if (response.statusCode == 200) {
      BrandsResponse allBrands =
          BrandsResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Api Response ====================");
      debugPrint("== ${allBrands.results ?? "null"} ==");
      debugPrint("===================================================");
      return Right(allBrands);
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

  Future<Either<ServerFailure, ProductsResponse>> getProducts(
      ProductsSort? sortBy) async {
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

    if (response.statusCode == 200) {
      ProductsResponse allProducts =
          ProductsResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Api Response ====================");
      debugPrint("== ${allProducts.results ?? "null"} ==");
      debugPrint("===================================================");
      return Right(allProducts);
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

  Future<Either<ServerFailure, ProductsResponse>> getCategoryProducts(
      String categoryId) async {
    Map<String, dynamic>? params = {};
    http.Response response;

    if (categoryId != "") {
      params['category[in]'] = categoryId;
      Uri url = Uri.https(Constants.baseUrl, EndPoints.allProducts, params);
      response = await http.get(url);
    } else {
      Uri url = Uri.https(Constants.baseUrl, EndPoints.allProducts);
      response = await http.get(url);
    }

    debugPrint("==================== Api Call ====================");
    debugPrint(
        "== URL Request: ${Constants.baseUrl}${EndPoints.allProducts}?${params['category[in]']} ==");
    debugPrint("===================================================");

    if (response.statusCode == 200) {
      ProductsResponse allProducts =
          ProductsResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Api Response ====================");
      debugPrint("== ${allProducts.results ?? "null"} ==");
      debugPrint("===================================================");
      return Right(allProducts);
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

  // ===================== WishList =====================

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

  Future<Either<ServerFailure, ActionOnWishListResponse>>
      removeProductFromWishList(String productId) async {
    String? token = await getIt<LocalTokenManager>().getToken();

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");
    debugPrint("==================== Params ====================");
    debugPrint("== Product ==");
    debugPrint("== $productId ==");
    debugPrint("===================================================");

    String endPoint = "${EndPoints.wishList}/$productId";

    Uri url = Uri.https(Constants.baseUrl, endPoint);
    http.Response response =
        await http.delete(url, headers: {'token': token ?? ""});

    if (response.statusCode == 200) {
      ActionOnWishListResponse removeFromWishList =
          ActionOnWishListResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${removeFromWishList.status} ==");
      debugPrint("== ${removeFromWishList.message} ==");
      debugPrint("== ${removeFromWishList.data} ==");
      debugPrint("===================================================");

      return Right(removeFromWishList);
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

  Future<Either<ServerFailure, ActionOnWishListResponse>> addProductToWishList(
      String productId) async {
    String? token = await getIt<LocalTokenManager>().getToken();

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");
    debugPrint("==================== Request Body ====================");
    debugPrint("== productId ==");
    debugPrint("== $productId ==");
    debugPrint("===================================================");

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': token ?? ""
    };

    Uri url = Uri.https(Constants.baseUrl, EndPoints.wishList);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'productId': productId}),
    );

    if (response.statusCode == 200) {
      ActionOnWishListResponse removeFromWishList =
          ActionOnWishListResponse.fromJson(jsonDecode(response.body));

      debugPrint("==================== Response ====================");
      debugPrint("== ${removeFromWishList.status} ==");
      debugPrint("== ${removeFromWishList.message} ==");
      debugPrint("== ${removeFromWishList.data} ==");
      debugPrint("===================================================");

      return Right(removeFromWishList);
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

  // ===================== Cart =====================

  Future<Either<ServerFailure, CartResponse>> getCartProducts() async {
    String? token = await getIt<LocalTokenManager>().getToken();

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': token ?? ""
    };

    Uri url = Uri.https(Constants.baseUrl, EndPoints.cart);
    http.Response response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      CartResponse cartResponse =
          CartResponse.fromJson(jsonDecode(response.body));
      debugPrint("==================== Response ====================");
      debugPrint("== ${cartResponse.status} ==");
      debugPrint("== ${cartResponse.numOfCartItems} ==");
      debugPrint("== ${cartResponse.data} ==");
      debugPrint("===================================================");

      return Right(cartResponse);
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

  Future<Either<ServerFailure, String>> addProductToCart(
      String productId) async {
    String? token = await getIt<LocalTokenManager>().getToken();

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");
    debugPrint("==================== Request Body ====================");
    debugPrint("== productId ==");
    debugPrint("== $productId ==");
    debugPrint("===================================================");

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': token ?? ""
    };

    Uri url = Uri.https(Constants.baseUrl, EndPoints.cart);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'productId': productId}),
    );

    if (response.statusCode == 200) {
      return const Right("Product added successfully to your cart");
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

  Future<Either<ServerFailure, CartResponse>> updateProductQuantityInCart(
      String productId, String quantity) async {
    String? token = await getIt<LocalTokenManager>().getToken();

    String endPoint = "${EndPoints.cart}/$productId";

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");
    debugPrint("==================== Request Body ====================");
    debugPrint("== count ==");
    debugPrint("== $quantity ==");
    debugPrint("===================================================");

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': token ?? ""
    };

    Uri url = Uri.https(Constants.baseUrl, endPoint);
    http.Response response = await http.put(
      url,
      headers: headers,
      body: jsonEncode({'count': quantity}),
    );

    if (response.statusCode == 200) {
      CartResponse cartResponse =
          CartResponse.fromJson(jsonDecode(response.body));
      debugPrint("==================== Response ====================");
      debugPrint("== ${cartResponse.status} ==");
      debugPrint("== ${cartResponse.numOfCartItems} ==");
      debugPrint("== ${cartResponse.data} ==");
      debugPrint("===================================================");

      return Right(cartResponse);
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

  Future<Either<ServerFailure, CartResponse>> removeSpecificProductFromCart(
      String productId) async {
    String? token = await getIt<LocalTokenManager>().getToken();

    String endPoint = "${EndPoints.cart}/$productId";

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");
    debugPrint("==================== Request Body ====================");
    debugPrint("== Product Id ==");
    debugPrint("== $productId ==");
    debugPrint("===================================================");

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': token ?? ""
    };

    Uri url = Uri.https(Constants.baseUrl, endPoint);
    http.Response response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      CartResponse cartResponse =
          CartResponse.fromJson(jsonDecode(response.body));
      debugPrint("==================== Response ====================");
      debugPrint("== ${cartResponse.status} ==");
      debugPrint("== ${cartResponse.numOfCartItems} ==");
      debugPrint("== ${cartResponse.data} ==");
      debugPrint("===================================================");

      return Right(cartResponse);
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

  Future<Either<ServerFailure, String>> clearCart() async {
    String? token = await getIt<LocalTokenManager>().getToken();

    debugPrint("==================== Request Header ====================");
    debugPrint("== Token ==");
    debugPrint("== $token ==");
    debugPrint("===================================================");

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': token ?? ""
    };

    Uri url = Uri.https(Constants.baseUrl, EndPoints.cart);
    http.Response response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return const Right("Success");
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
