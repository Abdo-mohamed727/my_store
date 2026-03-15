import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_linear_button.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/auth/presintation/widgets/email_and_pass_form_field.dart';
import 'package:my_store/features/auth/presintation/widgets/language_and_theme_mode_buttons.dart';
import 'package:my_store/features/auth/presintation/widgets/login_button.dart';
import 'package:my_store/features/auth/presintation/widgets/text_login_welcome.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      child: Column(
        children: [
          LanguageAndThemeButtons(),
          SizedBox(height: 40.h),
          TextLoginWelcome(),

          SizedBox(height: 50.h),
          EmailAndPassFormField(
            emailController: emailController,
            passwordController: passwordController,
          ),
          SizedBox(height: 40.h),
          LoginButton(),
          SizedBox(height: 60.h),
          CoustomFadeInUp(
            duration: 1300,
            child: TextApp(
              text: context.translate(LangKeys.createAccount),
              theme: context.textStyle.copyWith(
                color: context.myColors.bluePinkLight,
                fontSize: 20,
                fontWeight: FontWeightHelper.mediaum,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
