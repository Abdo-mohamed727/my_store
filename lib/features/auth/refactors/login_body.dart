import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';

import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/auth/presintation/widgets/email_and_pass_form_field.dart';
import 'package:my_store/features/auth/presintation/widgets/language_and_theme_mode_buttons.dart';
import 'package:my_store/features/auth/presintation/widgets/login_button.dart';
import 'package:my_store/features/auth/presintation/widgets/text_welcome.dart';

class LoginBody extends StatefulWidget {
  LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const LanguageAndThemeButtons(),
            SizedBox(height: 40.h),
            TextWelcome(
              text: context.translate(LangKeys.login),
            ),

            SizedBox(height: 50.h),
            const EmailAndPassFormField(),
            SizedBox(height: 40.h),
            const LoginButton(),
            SizedBox(height: 40.h),
            CoustomFadeInUp(
              duration: 1300,
              child: TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.signUpPage);
                },
                child: TextApp(
                  text: context.translate(LangKeys.createAccount),
                  theme: context.textStyle.copyWith(
                    color: context.myColors.bluePinkLight,
                    fontSize: 20,
                    fontWeight: FontWeightHelper.mediaum,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
