// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersNumberResponse _$UsersNumberResponseFromJson(Map<String, dynamic> json) =>
    UsersNumberResponse(
      data: UserssDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersNumberResponseToJson(
  UsersNumberResponse instance,
) => <String, dynamic>{'data': instance.data};

UserssDataModel _$UserssDataModelFromJson(Map<String, dynamic> json) =>
    UserssDataModel(
      (json['users'] as List<dynamic>)
          .map((e) => UsersNumbersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserssDataModelToJson(UserssDataModel instance) =>
    <String, dynamic>{'users': instance.totalUserss};

UsersNumbersModel _$UsersNumbersModelFromJson(Map<String, dynamic> json) =>
    UsersNumbersModel(json['name'] as String);

Map<String, dynamic> _$UsersNumbersModelToJson(UsersNumbersModel instance) =>
    <String, dynamic>{'name': instance.name};
