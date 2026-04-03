import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/dashboard/data/data_source/dashboard_admin_data_source.dart';
import 'package:my_store/features/admin/dashboard/data/models/categorey_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/product_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/user_number_response.dart';

class DashboardAdminRepo {
  DashboardAdminRepo(this._dataSource);

  final DashboardAdminDataSource _dataSource;

  Future<ApiResult<ProductNumberResponse>> getProductsNumber() async {
    try {
      final response = await _dataSource.getProductsNumber();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<UsersNumberResponse>> getUsersNumber() async {
    try {
      final response = await _dataSource.getUsersNumber();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CategoryNumberResponse>> getCategoryNumber() async {
    try {
      final response = await _dataSource.getCategoryNumber();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
