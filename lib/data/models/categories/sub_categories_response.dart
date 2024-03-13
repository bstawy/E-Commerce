import '../home/pagination_dto.dart';
import 'sub_categories_dto.dart';

class SubCategoriesResponse {
  int? results;
  PaginationDto? metadata;
  List<SubCategoryDto>? data;

  SubCategoriesResponse({this.results, this.metadata, this.data});

  SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata = json["metadata"] == null
          ? null
          : PaginationDto.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => SubCategoryDto.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["results"] = results;
    if (metadata != null) {
      map["metadata"] = metadata?.toJson();
    }
    map["data"] = data?.map((e) => e.toJson()).toList();
    return map;
  }
}
