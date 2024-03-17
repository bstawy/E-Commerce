import '../../../domain/entities/cart/cart_data_entity.dart';
import 'cart_products_dto.dart';

class CartDataDto {
  String? id;
  String? cartOwner;
  List<CartProductsDto>? products;
  String? createdAt;
  String? updatedAt;
  num? totalCartProducts;
  num? totalCartPrice;

  CartDataDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.totalCartProducts,
    this.totalCartPrice,
  });

  CartDataDto.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => CartProductsDto.fromJson(e))
              .toList();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      totalCartProducts = json["__v"];
    }
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["cartOwner"] = cartOwner;
    if (products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = totalCartProducts;
    data["totalCartPrice"] = totalCartPrice;
    return data;
  }

  CartData toCartData() {
    return CartData(
      totalCartPrice: totalCartPrice,
      products: products?.map((e) => e.toCartProducts()).toList(),
    );
  }
}
