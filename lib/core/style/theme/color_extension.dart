import 'package:flutter/material.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.primaryColor, this.fontColor});

  final Color? primaryColor;
  final Color? fontColor;
  @override
  ThemeExtension<MyColors> copyWith({Color? primaryColor, Color? fontColor}) {
    return MyColors(primaryColor: primaryColor, fontColor: fontColor);
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other == null) return this;

    return MyColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      fontColor: Color.lerp(fontColor, other.fontColor, t),
    );
  }

  static const MyColors light = MyColors(
    primaryColor: ColorsLight.primaryColor,
    fontColor: ColorsLight.fontColor,
  );
  static const MyColors dark = MyColors(
    primaryColor: ColorsDark.primaryColor,
    fontColor: ColorsDark.fontColor,
  );
}
