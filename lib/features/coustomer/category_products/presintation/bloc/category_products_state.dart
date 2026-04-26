import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/coustomer/category_products/data/models/category_product_model.dart';

part 'category_products_state.freezed.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const factory CategoryProductsState.initial() = _Initial;
  const factory CategoryProductsState.loading() = _Loading;
  const factory CategoryProductsState.success(List<CategoryProductModel> products) = _Success;
  const factory CategoryProductsState.error(String message) = _Error;
}
