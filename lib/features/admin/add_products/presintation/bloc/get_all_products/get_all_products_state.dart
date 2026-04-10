import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

part 'get_all_products_state.freezed.dart';

@freezed
class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.initial() = _Initial;
  const factory GetAllProductsState.loading() = _Loading;
  const factory GetAllProductsState.success({
    required GetAllProductResponse response,
  }) = _Success;
  const factory GetAllProductsState.error({
    required String errorMessage,
  }) = _Error;
}
