import 'dart:async';

import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';
import 'package:my_store/features/coustomer/profile/data/models/profile_setting_item_model.dart';

class ProfileLocalDataSource {
  Future<UserRoleResponse> fetchProfileSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return UserRoleResponse(
      userRole: SharedPref().getString(ShareKeys.userRole),
      userId: SharedPref().getInt(ShareKeys.userId),
      name: _valueOrNull(SharedPref().getString(ShareKeys.userName)),
      email: _valueOrNull(SharedPref().getString(ShareKeys.userEmail)),
      avatar: _valueOrNull(SharedPref().getString(ShareKeys.userAvatar)),
    );
  }

  Future<List<ProfileSectionModel>> fetchSections() async {
    return const [
      ProfileSectionModel(
        title: 'Application Features',
        style: ProfileSectionStyle.preferences,
        items: [
          ProfileSettingItemModel(
            kind: ProfileSettingKind.language,
            title: 'Language',
            displayValue: 'English',
            trailingType: ProfileTrailingType.value,
          ),
          ProfileSettingItemModel(
            kind: ProfileSettingKind.darkMode,
            title: 'Dark Mode',
            isEnabledVisualState: false,
            trailingType: ProfileTrailingType.toggle,
          ),
          ProfileSettingItemModel(
            kind: ProfileSettingKind.notifications,
            title: 'Notifications',
            isEnabledVisualState: true,
            trailingType: ProfileTrailingType.toggle,
          ),
        ],
      ),
      ProfileSectionModel(
        title: 'Account',
        style: ProfileSectionStyle.account,
        items: [
          ProfileSettingItemModel(
            kind: ProfileSettingKind.logout,
            title: 'Logout',
            displayValue: 'logout',
            trailingType: ProfileTrailingType.action,
          ),
        ],
      ),
    ];
  }

  String? _valueOrNull(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    return value;
  }
}
