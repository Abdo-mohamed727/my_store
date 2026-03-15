import 'package:flutter/material.dart';
import 'package:my_store/core/app/screens/undar_builder_screen.dart';
import 'package:my_store/core/routes/app_router.dart';
import 'package:my_store/features/auth/presintation/screens/login_page.dart';

class AppRoutes {
  static const String loginpage = '/';
  static const String adminpage = 'admin_page';

  static Route<void>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginpage:
        return BaseRoute(page: LoginPage());

      default:
        return BaseRoute(page: UndarBuilderScreen());
    }
  }
}
