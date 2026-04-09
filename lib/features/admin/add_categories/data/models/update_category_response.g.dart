// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryResponse _$UpdateCategoryResponseFromJson(
  Map<String, dynamic> json,
) => UpdateCategoryResponse(
  data: UpdateCategoryDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateCategoryResponseToJson(
  UpdateCategoryResponse instance,
) => <String, dynamic>{'data': instance.data};

UpdateCategoryDataModel _$UpdateCategoryDataModelFromJson(
  Map<String, dynamic> json,
) => UpdateCategoryDataModel(
  updateCategory: UpdateCategoryResultModel.fromJson(
    json['updateCategory'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UpdateCategoryDataModelToJson(
  UpdateCategoryDataModel instance,
) => <String, dynamic>{'updateCategory': instance.updateCategory};

UpdateCategoryResultModel _$UpdateCategoryResultModelFromJson(
  Map<String, dynamic> json,
) => UpdateCategoryResultModel(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$UpdateCategoryResultModelToJson(
  UpdateCategoryResultModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
