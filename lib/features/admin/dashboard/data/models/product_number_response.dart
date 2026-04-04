import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_number_response.g.dart';

@JsonSerializable()
class ProductNumberResponse {
  ProductNumberResponse({required this.data});
  factory ProductNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductNumberResponseFromJson(json);
  final ProductsDataModel data;

  String get productsNumber =>
      data.productsNumber.isEmpty ? "0" : data.productsNumber.length.toString();
}

@JsonSerializable()
class ProductsDataModel {
  ProductsDataModel({required this.productsNumber});
  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataModelFromJson(json);
  @JsonKey(name: 'products')
  final List<PeoductsNumberModel> productsNumber;
}

@JsonSerializable()
class PeoductsNumberModel {
  PeoductsNumberModel({required this.title});

  factory PeoductsNumberModel.fromJson(Map<String, dynamic> json) =>
      _$PeoductsNumberModelFromJson(json);
  final String title;
}
