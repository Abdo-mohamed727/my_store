import 'package:flutter/material.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';

class TextLoginWelcome extends StatelessWidget {
  const TextLoginWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CoustomFadeInUp(
      child: Column(
        children: [
          TextApp(
            text: context.translate(LangKeys.login),
            theme: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          TextApp(
            textAlign: TextAlign.center,
            text: context.translate(LangKeys.welcome),
            theme: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeightHelper.mediaum,
            ),
          ),
        ],
      ),
    );
  }
}
