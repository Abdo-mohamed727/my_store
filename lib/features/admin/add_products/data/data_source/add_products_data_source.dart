import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/admin/admin_queries.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_response.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:my_store/features/admin/add_products/data/models/update_product_response.dart';

class AddProductsDataSource {
  AddProductsDataSource(this._apiService);

  final ApiService _apiService;

  Future<GetAllProductResponse> getAllProducts() async {
    final response = await _apiService.getAllProducts(
      AdminQueries().getAllProductsQuery(),
    );
    return response;
  }

  Future<CreateProductResponse> createProduct(
    CreateProductRequestBody body,
  ) async {
    final response = await _apiService.createProduct(
      AdminQueries().createProductQuery(
        title: body.title,
        price: body.price,
        description: body.description,
        images: body.images,
        categoryId: body.categoryId,
      ),
    );
    return response;
  }

  Future<UpdateProductResponse> updateProduct({
    required UpdateProductRequestBody body,
  }) async {
    final response = await _apiService.updateProduct(
      AdminQueries().updateProductQuery(
        id: body.id,
        title: body.title,
        price: body.price,
        description: body.description,
        images: body.images,
        categoryId: body.categoryId,
      ),
    );
    return response;
  }
}
