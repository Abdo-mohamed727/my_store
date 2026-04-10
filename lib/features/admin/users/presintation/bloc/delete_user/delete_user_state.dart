import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state.freezed.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = _Initial;
  const factory DeleteUserState.loading({required String userId}) =
      DeleteUserLoading;
  const factory DeleteUserState.success({required String userId}) =
      DeleteUserSuccess;
  const factory DeleteUserState.error({required String error}) =
      DeleteUserError;
}
