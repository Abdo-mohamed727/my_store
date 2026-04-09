import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/data_source/add_categories_data_source.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:my_store/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/data/models/update_category_response.dart';

class AddCategoriesRepo {
  AddCategoriesRepo(this._dataSource);

  final AddCategoriesDataSource _dataSource;

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await _dataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CreateCategoryResponse>> createCategory(
      {required CreateCategoryRequestBody body}) async {
    try {
      final response = await _dataSource.createCategory(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<UpdateCategoryResponse>> updateCategory(
      {required UpdateCategoryRequestBody body}) async {
    try {
      final response = await _dataSource.updateCategory(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<dynamic>> deleteCategory(
      {required String id}) async {
    try {
      await _dataSource.deleteCategory(id: id);
      return const ApiResult.success("Deleted");
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
