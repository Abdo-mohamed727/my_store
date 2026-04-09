import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_products/data/data_source/add_products_data_source.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_response.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

class AddProductsRepo {
  AddProductsRepo(this._dataSource);

  final AddProductsDataSource _dataSource;

  Future<ApiResult<GetAllProductResponse>> getAllProducts() async {
    try {
      final response = await _dataSource.getAllProducts();
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CreateProductResponse>> createProduct(
    CreateProductRequestBody body,
  ) async {
    try {
      final response = await _dataSource.createProduct(body);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
