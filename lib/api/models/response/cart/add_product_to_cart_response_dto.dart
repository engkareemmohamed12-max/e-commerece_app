import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddProductToCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final Data? data;

  AddProductToCartResponseDto ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddProductToCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductToCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductToCartResponseDtoToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<Products>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  Data ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Products {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  Products ({
    this.count,
    this.Id,
    this.product,
    this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }
}


