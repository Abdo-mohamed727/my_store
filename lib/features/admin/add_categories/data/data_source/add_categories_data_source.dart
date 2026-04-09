import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/admin/admin_queries.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_response.dart';

class AddCategoriesDataSource {
  AddCategoriesDataSource(this._apiService);

  final ApiService _apiService;

  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await _apiService.getAllCategories(
      AdminQueries().getAllCategoriesQuery(),
    );
    return response;
  }

  Future<CreateCategoryResponse> createCategory(
      {required CreateCategoryRequestBody body}) async {
    final response = await _apiService.createCategory(
      AdminQueries().createCategoryQuery(name: body.name, image: body.image),
    );
    return response;
  }
}
