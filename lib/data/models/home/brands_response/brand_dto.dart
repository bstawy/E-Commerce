import '../../../../domain/entities/home/brand_entity.dart';

class BrandDto {
  String? id;
  String? name;
  String? slug;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  BrandDto({
    this.id,
    this.name,
    this.slug,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  BrandDto.fromJson(dynamic json) {
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

  Brand toBrand() {
    return Brand(
      id: id,
      name: name,
      slug: slug,
      imageUrl: imageUrl,
    );
  }
}
