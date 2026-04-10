import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';

part 'search_users_state.freezed.dart';

@freezed
class SearchUsersState with _$SearchUsersState {
  const factory SearchUsersState.initial() = _Initial;
  const factory SearchUsersState.loading() = SearchUsersLoading;
  const factory SearchUsersState.success({
    required GetAllUsersResponse response,
  }) = SearchUsersSuccess;
  const factory SearchUsersState.error({required String errorMessage}) =
      SearchUsersError;
}
