import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_categories/data/models/update_category_response.dart';

part 'update_category_state.freezed.dart';

@freezed
class UpdateCategoryState with _$UpdateCategoryState {
  const factory UpdateCategoryState.initial() = _Initial;
  const factory UpdateCategoryState.loading() = _Loading;
  const factory UpdateCategoryState.success({
    required UpdateCategoryResponse response,
  }) = _Success;
  const factory UpdateCategoryState.error({required String errorMessage}) =
      _Error;
}
