import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/admin/admin_queries.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';

class UsersDataSource {
  UsersDataSource(this._apiService);

  final ApiService _apiService;

  Future<GetAllUsersResponse> getAllUsers() async {
    final response = await _apiService.getAllUsers(
      AdminQueries().getAllUsersQuery(),
    );
    return response;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      final response = await _apiService.deleteUser(
        AdminQueries().deleteUserQuery(id: id),
      );
      if (response is Map<String, dynamic>) {
        if (response.containsKey('errors')) {
          final errors = response['errors'] as List;
          if (errors.isNotEmpty) {
            throw Exception(errors.first['message'] ?? 'Failed to delete user');
          }
        }
        if (response.containsKey('data')) {
          final data = response['data'] as Map<String, dynamic>?;
          if (data != null && data.containsKey('deleteUser')) {
            final result = data['deleteUser'];
            if (result == null) {
              throw Exception('Failed to delete user');
            }
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
