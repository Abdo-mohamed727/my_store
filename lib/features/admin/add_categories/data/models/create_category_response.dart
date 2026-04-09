import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_response.g.dart';

@JsonSerializable()
class CreateCategoryResponse {
  CreateCategoryResponse({required this.data});
  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);
  final CreateCategoryDataModel data;
}

@JsonSerializable()
class CreateCategoryDataModel {
  CreateCategoryDataModel({required this.addCategory});
  factory CreateCategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDataModelFromJson(json);
  final CreateCategoryResultModel addCategory;
}

@JsonSerializable()
class CreateCategoryResultModel {
  CreateCategoryResultModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory CreateCategoryResultModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResultModelFromJson(json);
  final String id;
  final String name;
  final String image;
}
