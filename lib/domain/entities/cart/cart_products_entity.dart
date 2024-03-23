import 'package:equatable/equatable.dart';

import '../home/product_entity.dart';

class CartProducts extends Equatable {
  num? count;
  Product? product;
  num? price;

  CartProducts({
    this.count,
    this.product,
    this.price,
  });

  CartProducts.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }

    if (json["product"] is Map) {
      product =
          json["product"] == null ? null : Product.fromJson(json["product"]);
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    data["price"] = price;
    return data;
  }

  @override
  List<Object?> get props => [
        count,
        product,
        price,
      ];
}
