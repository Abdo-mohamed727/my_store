// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequestBody _$CreateProductRequestBodyFromJson(
  Map<String, dynamic> json,
) => CreateProductRequestBody(
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  categoryId: json['categoryId'] as String,
);

Map<String, dynamic> _$CreateProductRequestBodyToJson(
  CreateProductRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'price': instance.price,
  'description': instance.description,
  'images': instance.images,
  'categoryId': instance.categoryId,
};
