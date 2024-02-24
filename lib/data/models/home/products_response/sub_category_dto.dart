import '../../../../domain/entities/home/sub_category_entity.dart';

class SubCategoryDto {
  SubCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  SubCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

  SubCategory toSubCategory() {
    return SubCategory(
      id: id,
      name: name,
      slug: slug,
      categoryId: category,
    );
  }
}
