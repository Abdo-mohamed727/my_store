import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_response.g.dart';

@JsonSerializable()
class UserRoleResponse {
  UserRoleResponse({
    required this.userRole,
    required this.userId,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);

  @JsonKey(name: 'role')
  final String? userRole;

  @JsonKey(name: 'id')
  final int? userId;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'avatar')
  final String? avatar;

  Map<String, dynamic> toJson() => _$UserRoleResponseToJson(this);
}
