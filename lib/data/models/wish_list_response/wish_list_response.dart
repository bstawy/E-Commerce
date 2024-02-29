import '../home/products_response/product_dto.dart';

class WishListResponse {
  String? status;
  num? count;
  List<ProductDto>? data;

  WishListResponse({
    this.status,
    this.count,
    this.data,
  });

  WishListResponse.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((productDto) {
        data?.add(ProductDto.fromJson(productDto));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((productDto) => productDto.toJson()).toList();
    }
    return map;
  }
}
