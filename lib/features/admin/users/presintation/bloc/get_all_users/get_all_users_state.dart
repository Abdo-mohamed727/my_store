import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';

part 'get_all_users_state.freezed.dart';

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.initial() = _Initial;
  const factory GetAllUsersState.loading() = GetAllUsersLoading;
  const factory GetAllUsersState.success({
    required GetAllUsersResponse response,
  }) = GetAllUsersSuccess;
  const factory GetAllUsersState.error({required String errorMessage}) =
      GetAllUsersError;
}
