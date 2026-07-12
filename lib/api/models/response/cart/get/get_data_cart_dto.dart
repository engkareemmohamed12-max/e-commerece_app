import 'package:e_commerece_app/api/models/response/cart/get/get_products_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_cart_dto.g.dart';

@JsonSerializable()
class GetDataCartDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<GetProductsCartDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  GetDataCartDto ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory GetDataCartDto.fromJson(Map<String, dynamic> json) {
    return _$GetDataCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDataCartDtoToJson(this);
  }
}