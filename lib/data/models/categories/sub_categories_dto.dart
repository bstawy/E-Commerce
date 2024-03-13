import '../../../domain/entities/home/sub_category_entity.dart';

class SubCategoryDto {
  String? id;
  String? name;
  String? slug;
  String? categoryId;
  String? createdAt;
  String? updatedAt;

  SubCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  SubCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    categoryId = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = categoryId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  SubCategory toSubCategory() {
    return SubCategory(
      id: id,
      name: name,
      slug: slug,
      categoryId: categoryId,
    );
  }
}
