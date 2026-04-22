import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

/// Local mock data source for the home screen.
/// Provides hardcoded data for banners, categories, and featured products
/// pending back-end API integration.
class HomeLocalDataSource {
  List<PromoBannerModel> getPromoBanners() => const [
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

  List<ProductCategoryModel> getCategories() => const [
    ProductCategoryModel(
      id: 'cat_1',
      name: 'Clothes',
      image: 'assets/images/customer/cat_clothes.png',
    ),
    ProductCategoryModel(
      id: 'cat_2',
      name: 'Electronics',
      image: 'assets/images/customer/cat_electronics.png',
    ),
    ProductCategoryModel(
      id: 'cat_3',
      name: 'Furniture',
      image: 'assets/images/customer/cat_furniture.png',
    ),
    ProductCategoryModel(
      id: 'cat_4',
      name: 'Shoes',
      image: 'assets/images/customer/cat_shoes.png',
    ),
  ];
}
