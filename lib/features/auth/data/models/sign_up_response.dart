import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  SignUpResponse({required this.data});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  final SignUpDataModel data;
}

@JsonSerializable()
class SignUpDataModel {
  SignUpDataModel({required this.addUser});

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataModelFromJson(json);
  final SignUPAddUserModel addUser;
}

@JsonSerializable()
class SignUPAddUserModel {
  SignUPAddUserModel({
    required this.email,
    required this.id,
  });

  factory SignUPAddUserModel.fromJson(Map<String, dynamic> json) =>
      _$SignUPAddUserModelFromJson(json);
  final String id;
  final String email;
}
