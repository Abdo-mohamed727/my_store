import 'package:flutter/material.dart';
import 'package:my_store/core/app/language/app_localizations.dart';
import 'package:my_store/core/style/theme/color_extension.dart';

extension ContextExt on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  void pop() => Navigator.of(this).pop();

  Future<dynamic> pushReplacementNamed(String routeName, {Object? args}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? args}) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }

  //colors

  MyColors get myColors => Theme.of(this).extension<MyColors>()!;

  //language
  String? translate(String key) =>
      AppLocalizations.of(this)?.translate(key).toString();
}
