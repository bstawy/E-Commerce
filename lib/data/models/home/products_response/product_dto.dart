import '../../../../domain/entities/home/product_entity.dart';
import '../brands_response/brand_dto.dart';
import '../categories_response/category_dto.dart';
import 'sub_category_dto.dart';

class ProductDto {
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
  BrandDto? brand;
  CategoryDto? category;
  List<SubCategoryDto>? subCategory;
  String? createdAt;
  String? updatedAt;

  ProductDto({
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
    this.subCategory,
    this.createdAt,
    this.updatedAt,
  });

  ProductDto.fromJson(dynamic json) {
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
    brand = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? CategoryDto.fromJson(json['category'])
        : null;
    if (json['subcategory'] != null) {
      subCategory = [];
      json['subcategory'].forEach((v) {
        subCategory?.add(SubCategoryDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    if (subCategory != null) {
      map['subcategory'] = subCategory?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  Product toProduct() {
    return Product(
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      imageCover: imageCover,
      sold: sold,
      ratingsQuantity: ratingsQuantity,
      ratingsAverage: ratingsAverage,
      images: images,
      brand: brand?.toBrand(),
      category: category?.toCategory(),
      subcategory: subCategory?.map((e) => e.toSubCategory()).toList(),
    );
  }
}
