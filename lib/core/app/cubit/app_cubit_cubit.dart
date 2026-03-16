import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';

part 'app_cubit_state.dart';
part 'app_cubit_cubit.freezed.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(const AppCubitState.initial());

  bool isDark = true;
  String currentLangCode = 'en';
  Future<void> changeThemeMode({bool? shareMode}) async {
    if (shareMode != null) {
      isDark = shareMode;
      emit(AppCubitState.changeThemeMode(isDarkMode: isDark));
    } else {
      isDark = !isDark;
      await SharedPref()
          .setBoolean(ShareKeys.themeMode, isDark)
          .then(
            (value) => emit(AppCubitState.changeThemeMode(isDarkMode: isDark)),
          );
    }
  }

  void getSavedLanguage() {
    final result = SharedPref().containPreference(ShareKeys.language)
        ? SharedPref().getString(ShareKeys.language)
        : 'en';
    currentLangCode = result!;

    emit(AppCubitState.changelanguage(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLanguage(String langCode) async {
    currentLangCode = langCode;
    await SharedPref().setString(ShareKeys.language, currentLangCode);
    emit(AppCubitState.changelanguage(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLanguage('ar');

  void toEnglish() => _changeLanguage('en');
}
