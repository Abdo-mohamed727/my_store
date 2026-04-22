import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_response.g.dart';

@JsonSerializable()
class CreateProductResponse {
  CreateProductResponse({required this.data});

  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);

  final CreateProductData data;
}

@JsonSerializable()
class CreateProductData {
  CreateProductData({required this.addProduct});

  factory CreateProductData.fromJson(Map<String, dynamic> json) =>
      _$CreateProductDataFromJson(json);

  @JsonKey(name: 'addProduct')
  final CreateProductProduct addProduct;
}

@JsonSerializable()
class CreateProductProduct {
  CreateProductProduct({this.id, this.title});

  factory CreateProductProduct.fromJson(Map<String, dynamic> json) =>
      _$CreateProductProductFromJson(json);

  final String? id;
  final String? title;
}
