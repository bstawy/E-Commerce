import '../pagination_dto.dart';
import 'brand_dto.dart';

class BrandsResponse {
  BrandsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  BrandsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PaginationDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDto.fromJson(v));
      });
    }
  }

  num? results;
  PaginationDto? metadata;
  List<BrandDto>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
