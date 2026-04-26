import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/coustomer/category_products/data/models/category_product_model.dart';

abstract class CategoryProductsRepository {
  Future<ApiResult<List<CategoryProductModel>>> getProductsByCategory(int categoryId);
}
