import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/admin/admin_queries.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

class AddProductsDataSource {
  AddProductsDataSource(this._apiService);

  final ApiService _apiService;

  Future<GetAllProductResponse> getAllProducts() async {
    final response = await _apiService.getAllProducts(
      AdminQueries().getAllProductsQuery(),
    );
    return response;
  }
}
