import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_users_event.freezed.dart';

@freezed
class SearchUsersEvent with _$SearchUsersEvent {
  const factory SearchUsersEvent.started() = _started;
  const factory SearchUsersEvent.fetchUsersSearch({required String name}) =
      FetchSearchUsersEvent;
}
