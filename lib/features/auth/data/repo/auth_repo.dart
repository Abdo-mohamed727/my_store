import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:my_store/features/auth/data/models/login_request_body.dart';
import 'package:my_store/features/auth/data/models/login_response_body.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';

class AuthRepo {
  AuthRepo(this.authDataSource);

  final AuthDataSource authDataSource;

  Future<ApiResult<LoginResponse>> login(LoginRequestBody data) async {
    try {
      final response = await authDataSource.login(data: data);
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<UserRoleResponse> userRole(String token) async {
    try {
      final response = await authDataSource.userRole(token);
      return response;
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}
