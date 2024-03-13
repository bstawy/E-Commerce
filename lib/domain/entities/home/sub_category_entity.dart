import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'sub_category_entity.g.dart';

@HiveType(typeId: 3)
class SubCategory extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? categoryId;

  const SubCategory({
    this.id,
    this.name,
    this.slug,
    this.categoryId,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      categoryId: json["category"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "slug": slug,
      "category": categoryId,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        categoryId,
      ];
}
