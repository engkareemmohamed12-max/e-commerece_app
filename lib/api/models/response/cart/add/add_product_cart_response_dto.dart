import 'package:e_commerece_app/api/models/response/cart/add/add_data_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_product_cart_response_dto.g.dart';

@JsonSerializable()
class AddProductCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final AddDataCartDto? data;

  AddProductCartResponseDto ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddProductCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductCartResponseDtoToJson(this);
  }
}






