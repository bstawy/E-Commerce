import 'brand_entity.dart';
import 'category_entity.dart';
import 'sub_category_entity.dart';

class Product {
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  num? sold;
  num? ratingsQuantity;
  num? ratingsAverage;
  List<String>? images;
  Brand? brand;
  Category? category;
  List<SubCategory>? subcategory;
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

  Product.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    imageCover = json['imageCover'];
    sold = json['sold'];
    ratingsQuantity = json['ratingsQuantity'];
    ratingsAverage = json['ratingsAverage'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubCategory.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'] ?? false;
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
}
