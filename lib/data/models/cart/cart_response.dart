import 'cart_data_dto.dart';

class CartResponse {
  String? status;
  num? numOfCartItems;
  CartDataDto? data;

  CartResponse({
    this.status,
    this.numOfCartItems,
    this.data,
  });

  CartResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : CartDataDto.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["status"] = status;
    map["numOfCartItems"] = numOfCartItems;
    map["data"] = data?.toJson() ?? [];
    return map;
  }
}
