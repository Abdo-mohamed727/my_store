import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/connectivity_controller.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/language/app_localizations_setup.dart';
import 'package:my_store/core/app/screens/check_network.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/core/style/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (value) {
          return BlocProvider(
            create: (context) => sl<AppCubitCubit>()
              ..changeThemeMode(
                shareMode: SharedPref().getBoolean(ShareKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubitCubit, AppCubitState>(
                buildWhen: (prev, current) => prev != current,
                builder: (context, state) {
                  final cubit = context.read<AppCubitCubit>();

                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: cubit.isDark ? themeDark() : themeLight(),
                    locale: Locale(cubit.currentLangCode),
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    builder: (context, widget) {
                      return Scaffold(
                        body: Builder(
                          builder: (context) {
                            ConnectivityController.instance.init();

                            return widget!;
                          },
                        ),
                      );
                    },
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    initialRoute: AppRoutes.loginpage,
                  );
                },
              ),
            ),
          );
        } else {
          return const MaterialApp(title: 'no network', home: CheckNetwork());
        }
      },
    );
  }
}
