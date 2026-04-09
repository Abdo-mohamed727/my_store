import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_category_event.freezed.dart';

@freezed
class DeleteCategoryEvent with _$DeleteCategoryEvent {
  const factory DeleteCategoryEvent.started() = _Started;

  const factory DeleteCategoryEvent.deleteCategory({
    required String id,
  }) = _DeleteCategory;
}
