import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/features/auth/presintation/widgets/language_and_theme_mode_buttons.dart';
import 'package:my_store/features/auth/presintation/widgets/sign_up_form_field.dart';
import 'package:my_store/features/auth/presintation/widgets/text_welcome.dart';
import 'package:my_store/features/auth/presintation/widgets/user_avatar_image.dart';
import 'package:my_store/features/auth/presintation/widgets/sign_up_button.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 70.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            LanguageAndThemeButtons(),
            SizedBox(height: 15.h),
            TextWelcome(
              text: context.translate(LangKeys.signUp),
              subText: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.h),
            const UserAvatarImage(),
            SizedBox(height: 20.h),
            SignUpFormField(),
            SizedBox(height: 20.h),
            const SignUpButton(),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {
                context.pushReplacementNamed(AppRoutes.loginpage);
              },
              child: TextApp(
                text: context.translate(LangKeys.youHaveAccount),
                theme: context.textStyle.copyWith(
                  color: context.myColors.bluePinkLight,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
