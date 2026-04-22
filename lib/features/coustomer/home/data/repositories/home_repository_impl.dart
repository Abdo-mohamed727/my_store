import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';
import 'package:my_store/features/admin/add_categories/data/repo/add_categories_repo.dart';
import 'package:my_store/features/admin/add_products/data/repo/add_products_repo.dart';
import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

class HomeRepositoryImpl {
  HomeRepositoryImpl({
    required AddProductsRepo addProductsRepo,
    required AddCategoriesRepo addCategoriesRepo,
  }) : _addProductsRepo = addProductsRepo,
       _addCategoriesRepo = addCategoriesRepo;

  final AddProductsRepo _addProductsRepo;
  final AddCategoriesRepo _addCategoriesRepo;

  Future<List<PromoBannerModel>> getPromoBanners() async => const [
    PromoBannerModel(
      id: 'banner_1',
      imagePath: 'assets/images/customer/banners/banner_1.jpg',
    ),
    PromoBannerModel(
      id: 'banner_2',
      imagePath: 'assets/images/customer/banners/banner_2.jpg',
    ),
    PromoBannerModel(
      id: 'banner_3',
      imagePath: 'assets/images/customer/banners/banner_3.jpg',
    ),
    PromoBannerModel(
      id: 'banner_4',
      imagePath: 'assets/images/customer/banners/banner_4.jpg',
    ),
    PromoBannerModel(
      id: 'banner_5',
      imagePath: 'assets/images/customer/banners/banner_5.jpg',
    ),
    PromoBannerModel(
      id: 'banner_6',
      imagePath: 'assets/images/customer/banners/banner_6.jpg',
    ),
    PromoBannerModel(
      id: 'banner_7',
      imagePath: 'assets/images/customer/banners/banner_7.jpg',
    ),
  ];

  Future<List<ProductCategoryModel>> getCategories() async {
    final result = await _addCategoriesRepo.getAllCategories();
    return result.when(
      success: (response) => response.data.totalCategorys
          .map(_mapCategory)
          .toList(growable: false),
      failure: (error) => throw Exception(error),
    );
  }

  Future<List<ProductGetAllModel>> getFeaturedProducts() async {
    final result = await _addProductsRepo.getAllProducts();
    return result.when(
      success: (response) => response.productGetAllList,
      failure: (error) => throw Exception(error),
    );
  }

  ProductCategoryModel _mapCategory(GetAllCategoriesNumbersModel category) {
    return ProductCategoryModel(
      id: category.id,
      name: category.name,
      image: category.image,
    );
  }
}
