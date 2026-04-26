import 'package:json_annotation/json_annotation.dart';

part 'category_product_model.g.dart';

@JsonSerializable()
class CategoryProductsResponse {
  CategoryProductsResponse(this.data);

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductsResponseFromJson(json);

  final CategoryData data;
}

@JsonSerializable()
class CategoryData {
  CategoryData(this.products);

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  final List<CategoryProductModel> products;
}

@JsonSerializable()
class CategoryProductModel {
  CategoryProductModel(
    this.id,
    this.title,
    this.price,
    this.images,
  );

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);

  final String? id;
  final String? title;
  final double? price;
  final List<String> images;
}
