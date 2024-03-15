import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'brand_entity.g.dart';

@HiveType(typeId: 0)
class Brand extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? imageUrl;

  const Brand({
    this.id,
    this.name,
    this.slug,
    this.imageUrl,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      imageUrl: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "slug": slug,
      "image": imageUrl,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        imageUrl,
      ];
}
