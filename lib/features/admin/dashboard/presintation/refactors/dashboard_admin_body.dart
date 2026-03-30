import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/images.dart';
import 'package:my_store/features/admin/dashboard/presintation/widgets/dashboard_container.dart';

class DashboardAdminBody extends StatelessWidget {
  const DashboardAdminBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            const DashboardContainer(
              text: 'Products',
              number: '0',
              isLoading: true,
              image: AppImages.productsDrawer,
            ),
            SizedBox(height: 20.h),
            const DashboardContainer(
              text: 'Categories',
              number: '0',
              isLoading: false,
              image: AppImages.categoriesDrawer,
            ),
            SizedBox(height: 20.h),
            const DashboardContainer(
              text: 'Users',
              number: '0',
              isLoading: false,
              image: AppImages.usersDrawer,
            ),
          ],
        ),
      ),
    );
  }
}
