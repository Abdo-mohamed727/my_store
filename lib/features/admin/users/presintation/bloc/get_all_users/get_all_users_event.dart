import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_users_event.freezed.dart';

@freezed
class GetAllUsersEvent with _$GetAllUsersEvent {
  const factory GetAllUsersEvent.fetchGetAllUsers() = FetchGetAllUsersEvent;
}
