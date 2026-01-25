import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/connectivity_controller.dart';
import 'package:my_store/core/app/screens/check_network.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/features/login/presintation/screens/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (value) {
          return ScreenUtilInit(
            designSize: Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: .fromSeed(seedColor: Colors.deepPurple),
              ),
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
            ),
          );
        } else {
          return const MaterialApp(title: 'no network', home: CheckNetwork());
        }
      },
    );
  }
}
