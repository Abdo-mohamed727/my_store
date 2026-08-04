import 'package:flutter/material.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/colors/colors_light.dart';
import 'package:my_store/core/style/theme/color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    primaryColor: ColorsDark.blueDark,
    colorScheme: const ColorScheme.dark(
      primary: ColorsDark.blueDark,
      secondary: ColorsDark.accent,
      surface: ColorsDark.black1,
      onPrimary: ColorsDark.white,
      onSecondary: ColorsDark.white,
      onSurface: ColorsDark.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
    useMaterial3: true,
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    primaryColor: ColorsLight.pinkDark,
    colorScheme: const ColorScheme.light(
      primary: ColorsLight.pinkDark,
      secondary: ColorsLight.accent,
      onSecondary: ColorsLight.black,
      onSurface: ColorsLight.black,
    ),
    extensions: const <ThemeExtension<dynamic>>[MyColors.light],
    useMaterial3: true,
  );
}
