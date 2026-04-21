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
          imageUrl: 'assets/images/customer/cat_clothes.png',
        ),
        ProductCategoryModel(
          id: 'cat_2',
          name: 'Electronics',
          imageUrl: 'assets/images/customer/cat_electronics.png',
        ),
        ProductCategoryModel(
          id: 'cat_3',
          name: 'Furniture',
          imageUrl: 'assets/images/customer/cat_furniture.png',
        ),
        ProductCategoryModel(
          id: 'cat_4',
          name: 'Shoes',
          imageUrl: 'assets/images/customer/cat_shoes.png',
        ),
      ];

  List<ProductGetAllModel> getFeaturedProducts() => [
        ProductGetAllModel(
          'prod_1',
          'Sleek White & Orange Controller',
          69,
          ['assets/images/customer/prod_controller.png'],
          'Gaming controller with ergonomic design',
          CategoryProductModel('cat_2', 'Electronics'),
        ),
        ProductGetAllModel(
          'prod_2',
          'Sleek Wireless Headphones',
          443,
          ['assets/images/customer/prod_headphones.png'],
          'Premium wireless audio experience',
          CategoryProductModel('cat_2', 'Electronics'),
        ),
        ProductGetAllModel(
          'prod_3',
          'Mountain Graphic Tee',
          29,
          ['assets/images/customer/prod_tshirt.png'],
          'Comfortable everyday wear',
          CategoryProductModel('cat_1', 'Clothes'),
        ),
        ProductGetAllModel(
          'prod_4',
          'Sport Running Shoes',
          120,
          ['assets/images/customer/prod_shoes.png'],
          'Lightweight and responsive',
          CategoryProductModel('cat_4', 'Shoes'),
        ),
      ];
}
