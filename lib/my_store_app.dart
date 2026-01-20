import 'package:flutter/material.dart';
import 'package:my_store/core/app/connectivity_controller.dart';
import 'package:my_store/core/app/screens/check_network.dart';
import 'package:my_store/features/login/presintation/screens/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (value) {
          return MaterialApp(
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
            home: const LoginPage(),
          );
        } else {
          return const MaterialApp(
            title: 'no network',
            home: CheckNetwork(),
          );
        }
      },
    );
  }
}
