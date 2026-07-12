// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductToCartResponseDto _$AddProductToCartResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddProductToCartResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
  cartId: json['cartId'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddProductToCartResponseDtoToJson(
  AddProductToCartResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'numOfCartItems': instance.numOfCartItems,
  'cartId': instance.cartId,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['_id'] as String?,
  cartOwner: json['cartOwner'] as String?,
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  totalCartPrice: (json['totalCartPrice'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  '_id': instance.id,
  'cartOwner': instance.cartOwner,
  'products': instance.products,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
  'totalCartPrice': instance.totalCartPrice,
};

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  count: (json['count'] as num?)?.toInt(),
  Id: json['_id'] as String?,
  product: json['product'] as String?,
  price: (json['price'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'count': instance.count,
  '_id': instance.Id,
  'product': instance.product,
  'price': instance.price,
};
