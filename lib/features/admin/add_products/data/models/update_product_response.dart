import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_product_response.g.dart';

@JsonSerializable()
class UpdateProductResponse {
  UpdateProductResponse({required this.data});

  factory UpdateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductResponseFromJson(json);

  final UpdateProductData data;
}

@JsonSerializable()
class UpdateProductData {
  UpdateProductData({required this.updateProduct});

  factory UpdateProductData.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductDataFromJson(json);

  @JsonKey(name: 'updateProduct')
  final UpdateProductProduct updateProduct;
}

@JsonSerializable()
class UpdateProductProduct {
  UpdateProductProduct({this.id, this.title});

  factory UpdateProductProduct.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductProductFromJson(json);

  final String? id;
  final String? title;
}
