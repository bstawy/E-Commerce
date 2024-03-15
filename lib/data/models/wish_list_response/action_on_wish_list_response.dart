import '../../../domain/entities/wish_list/action_on_wish_list_entity.dart';

class ActionOnWishListResponse {
  String? status;
  String? message;
  List<String>? data;

  ActionOnWishListResponse({
    this.status,
    this.message,
    this.data,
  });

  ActionOnWishListResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

  ActionOnWishListModel toActionOnWishList() {
    return ActionOnWishListModel(wishListProductIds: data);
  }
}
