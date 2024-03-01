class ActionOnWishListModel {
  List<String>? wishListProductIds;

  ActionOnWishListModel({this.wishListProductIds});

  factory ActionOnWishListModel.fromJson(dynamic json) {
    return ActionOnWishListModel(
      wishListProductIds: json['wishListProductIds'] == null
          ? null
          : List<String>.from(json['wishListProductIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wishListProductIds': wishListProductIds,
    };
  }
}
