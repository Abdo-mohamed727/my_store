import 'package:flutter/material.dart';
import 'package:my_store/core/app/dialogs/custom_dialog.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/core/style/fonts/font_family.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/admin/add_categories/presintation/screens/add_categories_screen.dart';
import 'package:my_store/features/admin/add_notification/presintation/screens/add_notification_screen.dart';
import 'package:my_store/features/admin/add_products/presintation/screens/add_products_screen.dart';
import 'package:my_store/features/admin/dashboard/presintation/screens/dashboard_screen.dart';
import 'package:my_store/features/admin/users/presintation/screens/users_screen.dart';

List<DrawerItemModel> adminDrawerlist(BuildContext context) {
  return <DrawerItemModel>[
    DrawerItemModel(
      title: TextApp(
        text: 'DashBoard',
        theme: context.textStyle.copyWith(
          fontFamily: FontFamily.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
          color: Colors.white,
        ),
      ),
      icon: Icons.dashboard,
      page: const DashboardScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'Add Products',
        theme: context.textStyle.copyWith(
          fontWeight: FontWeightHelper.bold,
          fontFamily: FontFamily.poppinsEnglish,
          color: Colors.white,
        ),
      ),
      icon: Icons.add,
      page: const AddProductsScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'Add Notification',
        theme: context.textStyle.copyWith(
          fontWeight: FontWeightHelper.bold,
          fontFamily: FontFamily.poppinsEnglish,
          color: Colors.white,
        ),
      ),
      icon: Icons.notifications,
      page: const AddNotificationScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'Add Categories',
        theme: context.textStyle.copyWith(
          fontWeight: FontWeightHelper.bold,
          fontFamily: FontFamily.poppinsEnglish,
          color: Colors.white,
        ),
      ),
      icon: Icons.category,
      page: const AddCategoriesScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'USers',
        theme: context.textStyle.copyWith(
          fontWeight: FontWeightHelper.bold,
          fontFamily: FontFamily.poppinsEnglish,
          color: Colors.white,
        ),
      ),
      icon: Icons.person_2,
      page: const UsersScreen(),
    ),
    DrawerItemModel(
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Are you sure you want to log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,

            onPressed: () async {
              final navigator = Navigator.of(context);
              await SharedPref().removePreference(ShareKeys.accesstoken);
              await SharedPref().removePreference(ShareKeys.refreshtoken);
              await SharedPref().removePreference(ShareKeys.userId);
              await navigator.pushNamedAndRemoveUntil(
                AppRoutes.loginpage,
                (route) => false,
              );
            },
          );
        },
        child: TextApp(
          text: 'Log Out',
          theme: context.textStyle.copyWith(
            fontWeight: FontWeightHelper.bold,
            fontFamily: FontFamily.poppinsEnglish,
            color: Colors.white,
          ),
        ),
      ),

      icon: Icons.logout,
      page: const AddCategoriesScreen(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.title,
    required this.icon,
    required this.page,
  });
  final Widget title;
  final IconData icon;
  final Widget page;
}
