import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_category_state.freezed.dart';

@freezed
class DeleteCategoryState with _$DeleteCategoryState {
  const factory DeleteCategoryState.initial() = _Initial;
  const factory DeleteCategoryState.loading() = _Loading;
  const factory DeleteCategoryState.success() = _Success;
  const factory DeleteCategoryState.error({required String errorMessage}) =
      _Error;
}
