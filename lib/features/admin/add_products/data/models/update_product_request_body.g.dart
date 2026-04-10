// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductRequestBody _$UpdateProductRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateProductRequestBody(
  id: json['id'] as String,
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String,
  categoryId: json['categoryId'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$UpdateProductRequestBodyToJson(
  UpdateProductRequestBody instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'description': instance.description,
  'categoryId': instance.categoryId,
  'images': instance.images,
};
