import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_response.dart';

part 'create_category_state.freezed.dart';

@freezed
class CreateCategoryState with _$CreateCategoryState {
  const factory CreateCategoryState.initial() = _Initial;
  const factory CreateCategoryState.loading() = _Loading;
  const factory CreateCategoryState.success({
    required CreateCategoryResponse response,
  }) = _Success;
  const factory CreateCategoryState.error({required String errorMessage}) =
      _Error;
}
