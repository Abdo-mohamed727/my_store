import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/coustomer/category_products/data/data_sources/category_products_remote_data_source.dart';
import 'package:my_store/features/coustomer/category_products/data/models/category_product_model.dart';
import 'package:my_store/features/coustomer/category_products/domain/repositories/category_products_repository.dart';

class CategoryProductsRepositoryImpl implements CategoryProductsRepository {
  CategoryProductsRepositoryImpl(this._remoteDataSource);

  final CategoryProductsRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<List<CategoryProductModel>>> getProductsByCategory(int categoryId) async {
    try {
      final response = await _remoteDataSource.getProductsByCategory(categoryId);
      return ApiResult.success(response.data.products);
    } catch (e) {
      return const ApiResult.failure('Failed to get products by category. Please try again.');
    }
  }
}
