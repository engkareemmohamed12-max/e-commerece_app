import 'package:e_commerece_app/api/models/response/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../category_brand/common/metadata_dto.dart';

part 'product_response_dto.g.dart';

@JsonSerializable()
class ProductResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  ProductResponseDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductResponseDtoToJson(this);
  }
}









