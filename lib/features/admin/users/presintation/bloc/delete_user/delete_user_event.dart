import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_event.freezed.dart';

@freezed
class DeleteUserEvent with _$DeleteUserEvent {
  const factory DeleteUserEvent.started() = _started;
  const factory DeleteUserEvent.deleteUser({required String userId}) =
      RemoveUserEvent;
}
