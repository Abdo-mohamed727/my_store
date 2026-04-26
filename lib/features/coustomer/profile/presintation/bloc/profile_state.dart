import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';
import 'package:my_store/features/coustomer/profile/data/models/profile_setting_item_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.content({
    required UserRoleResponse summary,
    required List<ProfileSectionModel> sections,
  }) = _Content;
  const factory ProfileState.fallback({
    required UserRoleResponse summary,
    required List<ProfileSectionModel> sections,
  }) = _Fallback;
  const factory ProfileState.error({required String message}) = _Error;
}
