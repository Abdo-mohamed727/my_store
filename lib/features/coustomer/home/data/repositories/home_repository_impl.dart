import 'package:my_store/features/coustomer/home/data/datasources/home_local_data_source.dart';
import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/coustomer/home/domain/repositories/home_repository.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._localDataSource);

  final HomeLocalDataSource _localDataSource;

  @override
  Future<List<PromoBannerModel>> getPromoBanners() async =>
      _localDataSource.getPromoBanners();

  @override
  Future<List<ProductCategoryModel>> getCategories() async =>
      _localDataSource.getCategories();

  @override
  Future<List<ProductGetAllModel>> getFeaturedProducts() async =>
      _localDataSource.getFeaturedProducts();
}
