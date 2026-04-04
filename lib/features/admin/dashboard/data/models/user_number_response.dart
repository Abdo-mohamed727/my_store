import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_number_response.g.dart';

@JsonSerializable()
class UsersNumberResponse {
  UsersNumberResponse({required this.data});
  factory UsersNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberResponseFromJson(json);
  final UserssDataModel data;

  String get usersNumber =>
      data.totalUserss.isEmpty ? "0" : data.totalUserss.length.toString();
}

@JsonSerializable()
class UserssDataModel {
  UserssDataModel(this.totalUserss);
  factory UserssDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserssDataModelFromJson(json);
  @JsonKey(name: 'users')
  final List<UsersNumbersModel> totalUserss;
}

@JsonSerializable()
class UsersNumbersModel {
  UsersNumbersModel(this.name);

  factory UsersNumbersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersNumbersModelFromJson(json);
  final String name;
}
