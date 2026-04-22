import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/admin/admin_queries.dart';
import 'package:my_store/features/admin/dashboard/data/models/categorey_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/product_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/user_number_response.dart';

class DashboardAdminDataSource {
  DashboardAdminDataSource(this._apiService);

  final ApiService _apiService;

  Future<ProductNumberResponse> getProductsNumber() async {
    final response = await _apiService.getProductsNumber(
      AdminQueries().getProductsNumberQuery(),
    );
    return response;
  }

  Future<UsersNumberResponse> getUsersNumber() async {
    final response = await _apiService.getUsersNumber(
      AdminQueries().getUsersNumberQuery(),
    );
    return response;
  }

  Future<CategoryNumberResponse> getCategoryNumber() async {
    final response = await _apiService.getCategoryNumber(
      AdminQueries().getCategoryNumberQuery(),
    );
    return response;
  }
}
