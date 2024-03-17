import 'package:equatable/equatable.dart';

import 'cart_products_entity.dart';

class CartData extends Equatable {
  List<CartProducts>? products;
  num? totalCartPrice;

  CartData({
    this.products,
    this.totalCartPrice,
  });

  CartData.fromJson(Map<String, dynamic> json) {
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => CartProducts.fromJson(e))
              .toList();
    }
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    data["totalCartPrice"] = totalCartPrice;
    return data;
  }

  @override
  List<Object?> get props => [
        products,
        totalCartPrice,
      ];
}
