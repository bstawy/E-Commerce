import 'package:injectable/injectable.dart';

class Constants {
  static const String baseUrl = "ecommerce.routemisr.com";
}

class EndPoints {
  static const String register = "/api/v1/auth/signup";
  static const String login = "/api/v1/auth/signin";
  static const String allCategories = "/api/v1/categories";
  static const String subCategoriesOnCategory = "/subcategories";
  static const String allBrands = "/api/v1/brands";
  static const String allProducts = "/api/v1/products";
  static const String wishList = "/api/v1/wishlist";
  static const String cart = "/api/v1/cart";
}

@injectable
class HiveBoxKeys {
  static const String homeCategories = "home_categories_box";
  static const String homeBrands = "home_brands_box";
  static const String homeProducts = "home_products_box";
  static const String categories = "categories_box";
  static const String subCategories = "sub_categories_box";
  static const String categoryProducts = "category_products_box";
  static const String wishList = "wish_list_box";
}
