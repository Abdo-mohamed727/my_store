// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      data: SignUpDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{'data': instance.data};

SignUpDataModel _$SignUpDataModelFromJson(Map<String, dynamic> json) =>
    SignUpDataModel(
      addUser: SignUPAddUserModel.fromJson(
        json['addUser'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SignUpDataModelToJson(SignUpDataModel instance) =>
    <String, dynamic>{'addUser': instance.addUser};

SignUPAddUserModel _$SignUPAddUserModelFromJson(Map<String, dynamic> json) =>
    SignUPAddUserModel(
      email: json['email'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$SignUPAddUserModelToJson(SignUPAddUserModel instance) =>
    <String, dynamic>{'id': instance.id, 'email': instance.email};
