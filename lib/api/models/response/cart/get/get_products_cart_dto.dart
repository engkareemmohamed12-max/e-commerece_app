import 'package:e_commerece_app/api/models/response/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_products_cart_dto.g.dart';

@JsonSerializable()
class GetProductsCartDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;

  GetProductsCartDto ({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory GetProductsCartDto.fromJson(Map<String, dynamic> json) {
    return _$GetProductsCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetProductsCartDtoToJson(this);
  }
}