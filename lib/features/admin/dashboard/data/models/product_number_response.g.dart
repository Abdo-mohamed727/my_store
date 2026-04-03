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
      ProductsNumber: (json['Products'] as List<dynamic>)
          .map((e) => PeoductsNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDataModelToJson(ProductsDataModel instance) =>
    <String, dynamic>{'Products': instance.ProductsNumber};

PeoductsNumberModel _$PeoductsNumberModelFromJson(Map<String, dynamic> json) =>
    PeoductsNumberModel(name: json['name'] as String);

Map<String, dynamic> _$PeoductsNumberModelToJson(
  PeoductsNumberModel instance,
) => <String, dynamic>{'name': instance.name};
