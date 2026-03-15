import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/auth/login_body.dart';
import 'package:my_store/features/auth/presintation/widgets/coustom_painter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(double.infinity, 150.h),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.myColors.bluePinkLight!,
              context.myColors.bluePinkLight!,
              context.myColors.bluePinkLight!,
              context.myColors.bluePinkDark!,
            ],
          ),
        ),
      ),
      body: LoginBody(),
    );
  }
}
