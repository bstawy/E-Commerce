import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
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
