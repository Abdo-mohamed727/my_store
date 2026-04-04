// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductNumberResponse _$ProductNumberResponseFromJson(
  Map<String, dynamic> json,
) => ProductNumberResponse(
  data: ProductsDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductNumberResponseToJson(
  ProductNumberResponse instance,
) => <String, dynamic>{'data': instance.data};

ProductsDataModel _$ProductsDataModelFromJson(Map<String, dynamic> json) =>
    ProductsDataModel(
      productsNumber: (json['products'] as List<dynamic>)
          .map((e) => PeoductsNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDataModelToJson(ProductsDataModel instance) =>
    <String, dynamic>{'products': instance.productsNumber};

PeoductsNumberModel _$PeoductsNumberModelFromJson(Map<String, dynamic> json) =>
    PeoductsNumberModel(title: json['title'] as String);

Map<String, dynamic> _$PeoductsNumberModelToJson(
  PeoductsNumberModel instance,
) => <String, dynamic>{'title': instance.title};
