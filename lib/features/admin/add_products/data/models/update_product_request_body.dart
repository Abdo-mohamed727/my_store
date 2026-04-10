import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_product_request_body.g.dart';

@JsonSerializable()
class UpdateProductRequestBody {
  UpdateProductRequestBody({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.images,
  });

  Map<String, dynamic> toJson() => _$UpdateProductRequestBodyToJson(this);

  final String id;
  final String title;
  final double price;
  final String description;
  final String categoryId;
  final List<String> images;
}
