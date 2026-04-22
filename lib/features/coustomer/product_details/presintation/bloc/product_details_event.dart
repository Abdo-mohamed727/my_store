import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_event.freezed.dart';

@freezed
class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.started() = _started;
  const factory ProductDetailsEvent.fetchProductDetails({
    required String productId,
  }) = FetchProductDetailsEvent;
}
