import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/users/data/data_source/users_data_source.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';

class UsersRepo {
  UsersRepo(this._dataSource);

  final UsersDataSource _dataSource;

  Future<ApiResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final response = await _dataSource.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> deleteUser({required String id}) async {
    try {
      await _dataSource.deleteUser(id: id);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
