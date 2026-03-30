import 'package:flutter/material.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppbar(
        title: 'Products',
        backGroundColor: ColorsDark.mainColor,
        ismain: true,
      ),
    );
  }
}
