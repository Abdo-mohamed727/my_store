import 'package:flutter/material.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppbar(
        title: 'Notifications',
        backGroundColor: ColorsDark.mainColor,
        ismain: true,
      ),
    );
  }
}
