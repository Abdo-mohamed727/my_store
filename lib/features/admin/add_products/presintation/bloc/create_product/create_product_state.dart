import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_response.dart';

part 'create_product_state.freezed.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _InitialCreateProduct;
  const factory CreateProductState.loading() = _LoadingCreateProduct;
  const factory CreateProductState.success({
    required CreateProductResponse response,
  }) = _SuccessCreateProduct;
  const factory CreateProductState.error({
    required String errorMessage,
  }) = _ErrorCreateProduct;
}