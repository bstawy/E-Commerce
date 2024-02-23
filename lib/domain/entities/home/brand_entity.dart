import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
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
