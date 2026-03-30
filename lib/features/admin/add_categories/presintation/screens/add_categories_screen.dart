import 'package:flutter/material.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppbar(
        title: 'Categories',
        backGroundColor: ColorsDark.mainColor,
        ismain: true,
      ),
    );
  }
}
