import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required List<PromoBannerModel> banners,
    required List<ProductCategoryModel> categories,
    required List<ProductGetAllModel> products,
    @Default(<String>{}) Set<String> favoriteProductIds,
  }) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
