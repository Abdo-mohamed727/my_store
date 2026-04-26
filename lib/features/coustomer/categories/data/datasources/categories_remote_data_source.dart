import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/admin/admin_queries.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';

abstract class CategoriesRemoteDataSource {
  Future<GetAllCategoriesResponse> getAllCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  CategoriesRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await _apiService.getAllCategories(
      AdminQueries().getAllCategoriesQuery(),
    );
    return response;
  }
}
