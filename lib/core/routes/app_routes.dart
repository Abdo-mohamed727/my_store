import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/screens/undar_builder_screen.dart';
import 'package:my_store/core/routes/app_router.dart';
import 'package:my_store/features/auth/presintation/cubit/bloc/auth_bloc.dart';
import 'package:my_store/features/auth/presintation/screens/login_page.dart';
import 'package:my_store/features/auth/presintation/screens/sign_up_page.dart';

class AppRoutes {
  static const String loginpage = '/';
  static const String adminpage = 'Admin_page';
  static const String signUpPage = 'Sign_up_page';

  static Route<void>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginpage:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginPage(),
          ),
        );

      case signUpPage:
        return BaseRoute(page: SignUpPage());

      default:
        return BaseRoute(page: UndarBuilderScreen());
    }
  }
}
