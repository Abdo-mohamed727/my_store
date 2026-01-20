import 'package:flutter/material.dart';
import 'package:my_store/core/app/style/images.dart';

class CheckNetwork extends StatelessWidget {
  const CheckNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.networkerror),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
