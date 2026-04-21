// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
  Map<String, dynamic> json,
) => ProductCategoryModel(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$ProductCategoryModelToJson(
  ProductCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
};
