// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductsResponse _$CategoryProductsResponseFromJson(
  Map<String, dynamic> json,
) => CategoryProductsResponse(
  CategoryData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryProductsResponseToJson(
  CategoryProductsResponse instance,
) => <String, dynamic>{'data': instance.data};

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
  (json['products'] as List<dynamic>)
      .map((e) => CategoryProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{'products': instance.products};

CategoryProductModel _$CategoryProductModelFromJson(
  Map<String, dynamic> json,
) => CategoryProductModel(
  json['id'] as String?,
  json['title'] as String?,
  (json['price'] as num?)?.toDouble(),
  (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CategoryProductModelToJson(
  CategoryProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'images': instance.images,
};
