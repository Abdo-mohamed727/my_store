/// Enumeration for different types of profile settings
enum ProfileSettingKind {
  language,
  darkMode,
  notifications,
  logout,
}

/// Enumeration for trailing view types in profile setting tiles
enum ProfileTrailingType {
  /// Shows a toggle switch
  toggle,

  /// Shows a text value with chevron
  value,

  /// Shows an action-style presentation
  action,
}

/// Enumeration for visual styling of profile sections
enum ProfileSectionStyle {
  /// Standard settings section style
  preferences,

  /// Account/logout section style (emphasized)
  account,
}

/// Model representing a single profile setting item/row
class ProfileSettingItemModel {
  const ProfileSettingItemModel({
    required this.kind,
    required this.title,
    required this.trailingType,
    this.displayValue,
    this.isEnabledVisualState,
  });

  /// The type of setting (language, darkMode, notifications, logout)
  final ProfileSettingKind kind;

  /// The title/label displayed in the row
  final String title;

  /// Optional display value for the trailing widget (e.g., "English")
  final String? displayValue;

  /// Optional state for toggle-style rows (on/off)
  final bool? isEnabledVisualState;

  /// The type of trailing widget to display
  final ProfileTrailingType trailingType;
}

/// Model representing a section of profile settings
class ProfileSectionModel {
  const ProfileSectionModel({
    required this.title,
    required this.items,
    required this.style,
  });

  /// The section heading/title
  final String title;

  /// The list of setting items in this section
  final List<ProfileSettingItemModel> items;

  /// Visual styling hint for the section
  final ProfileSectionStyle style;
}
