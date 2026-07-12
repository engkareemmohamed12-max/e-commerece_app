import 'package:e_commerece_app/api/models/response/cart/add/add_product_cart_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'add_product_dto.dart';

part 'add_data_cart_dto.g.dart';

@JsonSerializable()
class AddDataCartDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<AddProductDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  AddDataCartDto ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory AddDataCartDto.fromJson(Map<String, dynamic> json) {
    return _$AddDataCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddDataCartDtoToJson(this);
  }
}