import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_response.g.dart';

@JsonSerializable()
class UpdateCategoryResponse {
  UpdateCategoryResponse({required this.data});
  factory UpdateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryResponseFromJson(json);
  final UpdateCategoryDataModel data;
}

@JsonSerializable()
class UpdateCategoryDataModel {
  UpdateCategoryDataModel({required this.updateCategory});
  factory UpdateCategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryDataModelFromJson(json);
  final UpdateCategoryResultModel updateCategory;
}

@JsonSerializable()
class UpdateCategoryResultModel {
  UpdateCategoryResultModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory UpdateCategoryResultModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryResultModelFromJson(json);
  final String id;
  final String name;
  final String image;
}
