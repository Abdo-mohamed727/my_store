import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';
import 'package:my_store/core/app/language/app_localizations.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_linear_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';

class LanguageAndThemeButtons extends StatelessWidget {
  const LanguageAndThemeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubitCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CoustomFadeInRight(
              child: CustomLinearButton(
                onPressed: cubit.changeThemeMode,
                child: Icon(
                  cubit.isDark
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        CoustomFadeInLeft(
          child: CustomLinearButton(
            height: 50.h,
            width: 100.w,
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
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
