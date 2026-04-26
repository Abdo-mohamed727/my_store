import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';
import 'package:my_store/features/coustomer/categories/data/datasources/categories_remote_data_source.dart';

class CategoriesRepository {
  CategoriesRepository(this._remoteDataSource);

  final CategoriesRemoteDataSource _remoteDataSource;

  Future<ApiResult<List<GetAllCategoriesNumbersModel>>> getAllCategories() async {
    try {
      final response = await _remoteDataSource.getAllCategories();
      return ApiResult.success(response.data.totalCategorys);
    } catch (e) {
      return const ApiResult.failure('Failed to load categories');
    }
  }
}
