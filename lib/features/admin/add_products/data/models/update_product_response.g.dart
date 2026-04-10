// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductResponse _$UpdateProductResponseFromJson(
  Map<String, dynamic> json,
) => UpdateProductResponse(
  data: UpdateProductData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProductResponseToJson(
  UpdateProductResponse instance,
) => <String, dynamic>{'data': instance.data};

UpdateProductData _$UpdateProductDataFromJson(Map<String, dynamic> json) =>
    UpdateProductData(
      updateProduct: UpdateProductProduct.fromJson(
        json['updateProduct'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UpdateProductDataToJson(UpdateProductData instance) =>
    <String, dynamic>{'updateProduct': instance.updateProduct};

UpdateProductProduct _$UpdateProductProductFromJson(
  Map<String, dynamic> json,
) => UpdateProductProduct(
  id: json['id'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$UpdateProductProductToJson(
  UpdateProductProduct instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};
