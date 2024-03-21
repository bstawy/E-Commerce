import '../../../domain/entities/cart/cart_products_entity.dart';
import '../home/products_response/product_dto.dart';

class CartProductsDto {
  num? count;
  String? id;
  ProductDto? product;
  num? price;

  CartProductsDto({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  CartProductsDto.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is Map) {
      product =
          json["product"] == null ? null : ProductDto.fromJson(json["product"]);
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["_id"] = id;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    data["price"] = price;
    return data;
  }

  CartProducts toCartProducts() {
    return CartProducts(
      count: count,
      price: price,
      product: product?.toProduct(),
    );
  }
}
