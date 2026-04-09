import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_categories_response.g.dart';

@JsonSerializable()
class GetAllCategoriesResponse {
  GetAllCategoriesResponse({required this.data});
  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);
  final GetAllCategoriesDataModel data;
}

@JsonSerializable()
class GetAllCategoriesDataModel {
  GetAllCategoriesDataModel({required this.totalCategorys});
  factory GetAllCategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesDataModelFromJson(json);
  @JsonKey(name: 'categories')
  final List<GetAllCategoriesNumbersModel> totalCategorys;
}

@JsonSerializable()
class GetAllCategoriesNumbersModel {
  GetAllCategoriesNumbersModel({
    required this.id,
    required this.image,
    required this.name,
  });
  factory GetAllCategoriesNumbersModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesNumbersModelFromJson(json);
  final String name;
  final String id;
  final String image;
}
