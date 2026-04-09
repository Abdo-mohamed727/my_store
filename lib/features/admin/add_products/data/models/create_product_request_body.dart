import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_request_body.g.dart';

@JsonSerializable()
class CreateProductRequestBody {
  CreateProductRequestBody({
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() => _$CreateProductRequestBodyToJson(this);

  final String title;
  final double price;
  final String description;
  final List<String> images;
  final String categoryId;
}