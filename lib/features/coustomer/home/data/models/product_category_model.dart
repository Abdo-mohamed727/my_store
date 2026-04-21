import 'package:json_annotation/json_annotation.dart';

part 'product_category_model.g.dart';

@JsonSerializable()
class ProductCategoryModel {
  const ProductCategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}
