import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_products/data/models/update_product_response.dart';

part 'update_product_state.freezed.dart';

@freezed
class UpdateProductState with _$UpdateProductState {
  const factory UpdateProductState.initial() = _Initial;
  const factory UpdateProductState.loading() = _Loading;
  const factory UpdateProductState.success({
    required UpdateProductResponse response,
  }) = _Success;
  const factory UpdateProductState.error({required String errorMessage}) =
      _Error;
}
