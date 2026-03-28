import 'package:dio/dio.dart';
import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/auth/auth_queries.dart';
import 'package:my_store/features/auth/data/models/login_request_body.dart';
import 'package:my_store/features/auth/data/models/login_response_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_response.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';

class AuthDataSource {
  AuthDataSource(this.apiService);

  final ApiService apiService;

  Future<LoginResponse> login({required LoginRequestBody data}) async {
    final response = await apiService.login(
      AuthQueries().loginQuery(data: data),
    );
    return response;
  }

  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    return response;
  }

  Future<SignUpResponse> signUp({required SignUpRequestBody data}) async {
    final response = await apiService.signUp(
      AuthQueries().signUpQuery(data: data),
    );
    return response;
  }
}
