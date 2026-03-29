// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      final token = SharedPref().getString(ShareKeys.accesstoken);
      if (token != null && token.isNotEmpty) {
        dio!.options.headers['Authorization'] = 'Bearer $token';
      }

      debugPrint(
        "[USER Token] ====> ${token ?? 'NULL TOKEN'}",
      );

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        request: false,
        compact: false,
      ),
    );
  }

  static void updateAuthToken(String token) {
    if (dio != null) {
      dio!.options.headers['Authorization'] = 'Bearer $token';
      debugPrint("[USER Token Updated] ====> $token");
    }
  }

  static void clearAuthToken() {
    if (dio != null) {
      dio!.options.headers.remove('Authorization');
      debugPrint("[USER Token Cleared]");
    }
  }
}
