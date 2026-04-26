import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/coustmer/category_products_queries.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/coustomer/category_products/data/models/category_product_model.dart';

abstract class CategoryProductsRemoteDataSource {
  Future<CategoryProductsResponse> getProductsByCategory(int categoryId);
}

class CategoryProductsRemoteDataSourceImpl
    implements CategoryProductsRemoteDataSource {
  CategoryProductsRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<CategoryProductsResponse> getProductsByCategory(int categoryId) async {
    final response = await _apiService.getProductsByCategory(
      CategoryProductsQueries().getProductsByCategoryMapQuery(
        categoryId: categoryId,
      ),
    );
    return response;
  }
}
