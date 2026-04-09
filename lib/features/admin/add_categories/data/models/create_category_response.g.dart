// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponse _$CreateCategoryResponseFromJson(
  Map<String, dynamic> json,
) => CreateCategoryResponse(
  data: CreateCategoryDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateCategoryResponseToJson(
  CreateCategoryResponse instance,
) => <String, dynamic>{'data': instance.data};

CreateCategoryDataModel _$CreateCategoryDataModelFromJson(
  Map<String, dynamic> json,
) => CreateCategoryDataModel(
  addCategory: CreateCategoryResultModel.fromJson(
    json['addCategory'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CreateCategoryDataModelToJson(
  CreateCategoryDataModel instance,
) => <String, dynamic>{'addCategory': instance.addCategory};

CreateCategoryResultModel _$CreateCategoryResultModelFromJson(
  Map<String, dynamic> json,
) => CreateCategoryResultModel(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$CreateCategoryResultModelToJson(
  CreateCategoryResultModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
