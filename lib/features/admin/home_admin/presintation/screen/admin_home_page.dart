import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_store/core/app/images.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/utils/admin_drawer_list.dart';
import 'package:my_store/features/admin/dashboard/presintation/screens/dashboard_screen.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Widget page = const DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScreen(
            onPageChanged: (newPage) {
              setState(() {
                page = newPage;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24.0,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withValues(alpha: 0.5),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({required this.onPageChanged, super.key});

  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: const AdminAppbar(
        title: 'My Store',
        backGroundColor: ColorsDark.blueDark,
        ismain: false,
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerlist(context)
                .map(
                  (e) => ListTile(
                    onTap: () {
                      onPageChanged(e.page);
                    },
                    title: e.title,
                    leading: Icon(
                      e.icon,
                      color: Colors.white,
                    ),
                  ),
                )
                .toList(),
          ),
          Expanded(child: Image.asset(AppImages.drawerImage)),
        ],
      ),
    );
  }
}
