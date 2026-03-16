part of 'app_cubit_cubit.dart';

@freezed
class AppCubitState with _$AppCubitState {
  const factory AppCubitState.initial() = _Initial;
  const factory AppCubitState.changeThemeMode({required bool isDarkMode}) =
      _ChangeThemeMode;
  const factory AppCubitState.changelanguage({required Locale locale}) =
      _ChangeLanguage;
}
