import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'brand_entity.dart';
import 'category_entity.dart';
import 'sub_category_entity.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 2)
class Product extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? slug;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final num? quantity;

  @HiveField(5)
  final num? price;

  @HiveField(6)
  final num? priceAfterDiscount;

  @HiveField(7)
  final String? imageCover;

  @HiveField(8)
  final num? sold;

  @HiveField(9)
  final num? ratingsQuantity;

  @HiveField(10)
  final num? ratingsAverage;

  @HiveField(11)
  final List<String>? images;

  @HiveField(12)
  final Brand? brand;

  @HiveField(13)
  final Category? category;

  @HiveField(14)
  final List<SubCategory>? subcategory;

  @HiveField(15)
  bool? isFavorite;

  Product({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.sold,
    this.ratingsQuantity,
    this.ratingsAverage,
    this.images,
    this.brand,
    this.category,
    this.subcategory,
    this.isFavorite = false,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      imageCover: json['imageCover'],
      sold: json['sold'],
      ratingsQuantity: json['ratingsQuantity'],
      ratingsAverage: json['ratingsAverage'],
      images: json['images'] != null ? json['images'].cast<String>() : [],
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      subcategory: json['subcategory']
          ?.map<SubCategory>((e) => SubCategory.fromJson(e))
          .toList(),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['imageCover'] = imageCover;
    map['sold'] = sold;
    map['ratingsQuantity'] = ratingsQuantity;
    map['ratingsAverage'] = ratingsAverage;
    map['images'] = images;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['isFavorite'] = isFavorite;
    return map;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        description,
        quantity,
        price,
        priceAfterDiscount,
        imageCover,
        sold,
        ratingsQuantity,
        ratingsAverage,
        images,
        brand,
        category,
        subcategory,
        isFavorite,
      ];
}
