import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_linear_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';

class LanguageAndThemeButtons extends StatelessWidget {
  const LanguageAndThemeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoustomFadeInRight(
          child: CustomLinearButton(
            onPressed: () {},
            child: Icon(
              Icons.light_mode_outlined,
              color: Colors.white,
            ),
          ),
        ),
        CoustomFadeInLeft(
          child: CustomLinearButton(
            height: 50.h,
            width: 100.w,
            onPressed: () {},
            child: TextApp(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
