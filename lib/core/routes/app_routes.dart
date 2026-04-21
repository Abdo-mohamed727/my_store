import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/screens/undar_builder_screen.dart';
import 'package:my_store/core/routes/app_router.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/features/admin/home_admin/presintation/screen/admin_home_page.dart';
import 'package:my_store/features/auth/presintation/cubit/bloc/auth_bloc.dart';
import 'package:my_store/features/auth/presintation/screens/login_page.dart';
import 'package:my_store/features/auth/presintation/screens/sign_up_page.dart';
import 'package:my_store/features/coustomer/main_screen/presintation/screens/main_screen.dart';
import 'package:my_store/features/coustomer/home/presintation/screens/customer_search_screen.dart';

class AppRoutes {
  static const String loginpage = '/';
  static const String adminpage = 'Admin_page';
  static const String signUpPage = 'Sign_up_page';
  static const String adminHomePage = 'Admin_home_page';
  static const String customerHomePage = 'Customer_home_page';
  static const String customerSearch = 'Customer_search_page';

  static Route<void>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginpage:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginPage(),
          ),
        );
      case adminHomePage:
        return BaseRoute(page: const AdminHomePage());
      case customerHomePage:
        return BaseRoute(page: const MainScreen());

      case customerSearch:
        return BaseRoute(page: const CustomerSearchScreen());

      case signUpPage:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<UploadImageCubit>()),
              BlocProvider(create: (context) => sl<AuthBloc>()),
            ],
            child: const SignUpPage(),
          ),
        );

      default:
        return BaseRoute(page: const UndarBuilderScreen());
    }
  }
}
