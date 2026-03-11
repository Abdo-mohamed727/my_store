import 'package:flutter/material.dart';
import 'package:my_store/core/app/style/font_family.dart';
import 'package:my_store/core/app/style/font_weight.dart';
import 'package:my_store/core/extensions/context_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'My Store',
              style: TextStyle(
                fontWeight: FontWeightHelper.bold,
                fontFamily: FontFamily.poppinsEnglish,
                fontSize: 30,
                color: context.myColors.fontColor,
              ),
            ),
          ),
          Text(
            'الحمد لله',
            style: TextStyle(
              fontFamily: FontFamily.cairoArabic,
              fontWeight: FontWeightHelper.bold,
              fontSize: 20,
              color: context.myColors.fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
