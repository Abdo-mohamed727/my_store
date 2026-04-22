import '../datasources/product_details_remote_data_source.dart';
import '../models/product_model.dart';

class ProductDetailsRepositoryImpl {
  final ProductDetailsDataSource remoteDataSource;

  ProductDetailsRepositoryImpl({required this.remoteDataSource});

  Future<ProductDetailsResponse> getProductDetails(String productId) async {
    return await remoteDataSource.productDetails(id: productId);
  }
}
