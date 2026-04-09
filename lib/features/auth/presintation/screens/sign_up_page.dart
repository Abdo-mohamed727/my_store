import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/auth/presintation/widgets/coustom_painter.dart';
import 'package:my_store/features/auth/refactors/sign_up_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: CustomPaint(
          size: Size(double.infinity, 150),
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
      ),
      body: SignUpBody(),
    );
  }
}
