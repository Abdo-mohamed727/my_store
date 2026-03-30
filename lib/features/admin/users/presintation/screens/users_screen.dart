import 'package:flutter/material.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppbar(
        title: 'Users',
        backGroundColor: ColorsDark.mainColor,
        ismain: true,
      ),
      body: Center(
        child: Text('Users Screen'),
      ),
    );
  }
}
