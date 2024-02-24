import '../../../../domain/entities/home/category_entity.dart';

class CategoryDto {
  String? id;
  String? name;
  String? slug;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  CategoryDto({
    this.id,
    this.name,
    this.slug,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    imageUrl = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = imageUrl;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  Category toCategory() {
    return Category(
      id: id,
      name: name,
      slug: slug,
      imageUrl: imageUrl,
    );
  }
}
