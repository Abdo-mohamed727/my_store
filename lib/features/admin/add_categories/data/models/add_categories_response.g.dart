// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponse _$GetAllCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesResponse(
  data: GetAllCategoriesDataModel.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetAllCategoriesResponseToJson(
  GetAllCategoriesResponse instance,
) => <String, dynamic>{'data': instance.data};

GetAllCategoriesDataModel _$GetAllCategoriesDataModelFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesDataModel(
  totalCategorys: (json['categories'] as List<dynamic>)
      .map(
        (e) => GetAllCategoriesNumbersModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$GetAllCategoriesDataModelToJson(
  GetAllCategoriesDataModel instance,
) => <String, dynamic>{'categories': instance.totalCategorys};

GetAllCategoriesNumbersModel _$GetAllCategoriesNumbersModelFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesNumbersModel(
  id: json['id'] as String,
  image: json['image'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$GetAllCategoriesNumbersModelToJson(
  GetAllCategoriesNumbersModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'id': instance.id,
  'image': instance.image,
};
