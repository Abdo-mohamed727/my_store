import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/product_model.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.success({
    required ProductDetailsResponse product,
  }) = _Success;
  const factory ProductDetailsState.error({required String errorMessage}) =
      _Error;
}
