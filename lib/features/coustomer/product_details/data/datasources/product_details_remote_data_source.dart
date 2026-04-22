import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/graph_queries/coustmer/product_details_query.dart';
import 'package:my_store/features/coustomer/product_details/data/models/product_model.dart';

class ProductDetailsDataSource {
  const ProductDetailsDataSource(this._graphql);

  final ApiService _graphql;

  // Proudtc Details
  Future<ProductDetailsResponse> productDetails({required String id}) async {
    final response = await _graphql.productDetails(
      ProductDetailsQueries().getProductDetailsMapQuery(id: id),
    );
    return response;
  }
}
