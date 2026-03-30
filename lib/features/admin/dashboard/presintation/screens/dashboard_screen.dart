import 'package:flutter/material.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/dashboard/presintation/refactors/dashboard_admin_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppbar(
        title: 'DashBoard',
        backGroundColor: ColorsDark.mainColor,
        ismain: true,
      ),
      body: DashboardAdminBody(),
    );
  }
}
