import 'package:e_commerece_app/api/models/response/category_brand/common/category_or_brand_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'common/metadata_dto.dart';

part 'category_or_brand_response_dto.g.dart';

@JsonSerializable()
class CategoryOrBrandResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<CategoryOrBrandDto>? data;

  CategoryOrBrandResponseDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoryOrBrandResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CategoryOrBrandResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryOrBrandResponseDtoToJson(this);
  }
}






