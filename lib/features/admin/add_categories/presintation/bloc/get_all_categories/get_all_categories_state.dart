import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';

part 'get_all_categories_state.freezed.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.initial() = _Initial;
  const factory GetAllCategoriesState.loading() = _Loading;
  const factory GetAllCategoriesState.success({
    required GetAllCategoriesResponse response,
  }) = _Success;
  const factory GetAllCategoriesState.error({required String errorMessage}) =
      _Error;
}
