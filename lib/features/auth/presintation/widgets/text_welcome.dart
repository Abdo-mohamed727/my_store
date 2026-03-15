import 'package:flutter/material.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';

class TextWelcome extends StatelessWidget {
  const TextWelcome({required this.text, super.key, this.subText});

  final String? text;
  final String? subText;

  @override
  Widget build(BuildContext context) {
    return CoustomFadeInUp(
      child: Column(
        children: [
          TextApp(
            text: text,
            theme: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          TextApp(
            textAlign: TextAlign.center,
            text: subText ?? context.translate(LangKeys.welcome),
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
