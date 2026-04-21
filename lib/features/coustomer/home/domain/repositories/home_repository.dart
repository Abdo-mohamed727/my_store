import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

abstract class HomeRepository {
  Future<List<PromoBannerModel>> getPromoBanners();
  Future<List<ProductCategoryModel>> getCategories();
  Future<List<ProductGetAllModel>> getFeaturedProducts();
}
