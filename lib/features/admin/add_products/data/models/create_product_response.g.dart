// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponse _$CreateProductResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductResponse(
  data: CreateProductData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateProductResponseToJson(
  CreateProductResponse instance,
) => <String, dynamic>{'data': instance.data};

CreateProductData _$CreateProductDataFromJson(Map<String, dynamic> json) =>
    CreateProductData(
      addProduct: CreateProductProduct.fromJson(
        json['addProduct'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CreateProductDataToJson(CreateProductData instance) =>
    <String, dynamic>{'addProduct': instance.addProduct};

CreateProductProduct _$CreateProductProductFromJson(
  Map<String, dynamic> json,
) => CreateProductProduct(
  id: json['id'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$CreateProductProductToJson(
  CreateProductProduct instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};
