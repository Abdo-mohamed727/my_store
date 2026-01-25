import 'package:flutter/material.dart';
import 'package:my_store/core/app/style/font_weight.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('My Store', style: TextStyle(fontWeight: FontWeightHelper.bold)),
        ],
      ),
    );
  }
}
