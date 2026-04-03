import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_number_response.g.dart';

@JsonSerializable()
class ProductNumberResponse {
  ProductNumberResponse({required this.data});
  factory ProductNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductNumberResponseFromJson(json);
  final ProductsDataModel data;

  String get productsNumber =>
      data.ProductsNumber.isEmpty ? "0" : data.ProductsNumber.length.toString();
}

@JsonSerializable()
class ProductsDataModel {
  ProductsDataModel({required this.ProductsNumber});
  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataModelFromJson(json);
  @JsonKey(name: 'Products')
  final List<PeoductsNumberModel> ProductsNumber;
}

@JsonSerializable()
class PeoductsNumberModel {
  PeoductsNumberModel({required this.name});

  factory PeoductsNumberModel.fromJson(Map<String, dynamic> json) =>
      _$PeoductsNumberModelFromJson(json);
  final String name;
}
