class Constants {
  static const String baseUrl = "ecommerce.routemisr.com";
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };
}

class EndPoints {
  static const String register = "/api/v1/auth/signup";
  static const String login = "/api/v1/auth/signin";
  static const String allCategories = "/api/v1/categories";
  static const String allBrands = "/api/v1/brands";
  static const String allProducts = "/api/v1/products";
}
