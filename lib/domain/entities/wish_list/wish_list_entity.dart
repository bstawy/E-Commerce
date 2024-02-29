import '../home/product_entity.dart';

class WishList {
  List<Product>? data;

  WishList({
    this.data,
  });

  WishList.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((product) {
        data?.add(product.fromJson(product));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((product) => product.toJson()).toList();
    }
    return map;
  }
}
