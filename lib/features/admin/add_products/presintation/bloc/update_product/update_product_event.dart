import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_products/data/models/update_product_request_body.dart';

part 'update_product_event.freezed.dart';

@freezed
class UpdateProductEvent with _$UpdateProductEvent {
  const factory UpdateProductEvent.started() = _Started;
  const factory UpdateProductEvent.updateProduct({
    required UpdateProductRequestBody body,
  }) = _UpdateProduct;
}
