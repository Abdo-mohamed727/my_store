import 'package:freezed_annotation/freezed_annotation.dart';
part 'categorey_number_response.g.dart';

@JsonSerializable()
class CategoryNumberResponse {
  CategoryNumberResponse({required this.data});
  factory CategoryNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryNumberResponseFromJson(json);
  final CategorysDataModel data;

  String get categoryNumber =>
      data.totalCategorys.isEmpty ? "0" : data.totalCategorys.length.toString();
}

@JsonSerializable()
class CategorysDataModel {
  CategorysDataModel({required this.totalCategorys});
  factory CategorysDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategorysDataModelFromJson(json);
  @JsonKey(name: 'categories')
  final List<CategoryNumbersModel> totalCategorys;
}

@JsonSerializable()
class CategoryNumbersModel {
  CategoryNumbersModel({required this.title});
  factory CategoryNumbersModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryNumbersModelFromJson(json);
  final String? title;
}
