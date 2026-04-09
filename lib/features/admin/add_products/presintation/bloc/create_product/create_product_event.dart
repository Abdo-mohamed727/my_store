import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_request_body.dart';

part 'create_product_event.freezed.dart';

@freezed
class CreateProductEvent with _$CreateProductEvent {
  const factory CreateProductEvent.started() = _started;
  const factory CreateProductEvent.createProduct({
    required CreateProductRequestBody body,
  }) = _CreateProduct;
}
