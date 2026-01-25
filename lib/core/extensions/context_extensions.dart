import 'package:flutter/material.dart';

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
}
