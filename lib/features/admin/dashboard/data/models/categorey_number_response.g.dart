// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorey_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryNumberResponse _$CategoryNumberResponseFromJson(
  Map<String, dynamic> json,
) => CategoryNumberResponse(
  data: CategorysDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryNumberResponseToJson(
  CategoryNumberResponse instance,
) => <String, dynamic>{'data': instance.data};

CategorysDataModel _$CategorysDataModelFromJson(Map<String, dynamic> json) =>
    CategorysDataModel(
      totalCategorys: (json['categories'] as List<dynamic>)
          .map((e) => CategoryNumbersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategorysDataModelToJson(CategorysDataModel instance) =>
    <String, dynamic>{'categories': instance.totalCategorys};

CategoryNumbersModel _$CategoryNumbersModelFromJson(
  Map<String, dynamic> json,
) => CategoryNumbersModel(title: json['title'] as String?);

Map<String, dynamic> _$CategoryNumbersModelToJson(
  CategoryNumbersModel instance,
) => <String, dynamic>{'title': instance.title};
