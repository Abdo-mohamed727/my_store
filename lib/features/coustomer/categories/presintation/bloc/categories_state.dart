import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.success({
    required List<GetAllCategoriesNumbersModel> categories,
  }) = _Success;
  const factory CategoriesState.error({required String errorMessage}) = _Error;
}
