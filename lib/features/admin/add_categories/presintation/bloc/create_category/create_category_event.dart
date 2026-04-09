import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_request_body.dart';

part 'create_category_event.freezed.dart';

@freezed
class CreateCategoryEvent with _$CreateCategoryEvent {
  const factory CreateCategoryEvent.started() = _Started;

  const factory CreateCategoryEvent.createCategory({
    required CreateCategoryRequestBody body,
  }) = _CreateCategory;
}
