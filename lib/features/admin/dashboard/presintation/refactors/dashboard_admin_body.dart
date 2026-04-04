import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/images.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/categories_number/categories_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/products_number/products_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/users_number/users_number_bloc.dart';
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
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      text: 'Products',
                      number: '0',
                      isLoading: true,
                      image: AppImages.productsDrawer,
                    );
                  },
                  success: (number) {
                    return DashboardContainer(
                      text: 'Products',
                      number: number,
                      isLoading: false,
                      image: AppImages.productsDrawer,
                    );
                  },
                  error: (error) {
                    return const DashboardContainer(
                      text: 'Products',
                      number: 'Error',
                      isLoading: false,
                      image: AppImages.productsDrawer,
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      text: 'Categories',
                      number: '0',
                      isLoading: true,
                      image: AppImages.categoriesDrawer,
                    );
                  },
                  success: (number) {
                    return DashboardContainer(
                      text: 'Categories',
                      number: number,
                      isLoading: false,
                      image: AppImages.categoriesDrawer,
                    );
                  },
                  error: (error) {
                    return const DashboardContainer(
                      text: 'Categories',
                      number: 'Error',
                      isLoading: false,
                      image: AppImages.categoriesDrawer,
                    );
                  },
                );
              },
            ),

            SizedBox(height: 20.h),
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      text: 'Users',
                      number: '0',
                      isLoading: true,
                      image: AppImages.usersDrawer,
                    );
                  },
                  success: (number) {
                    return DashboardContainer(
                      text: 'Users',
                      number: number,
                      isLoading: false,
                      image: AppImages.usersDrawer,
                    );
                  },
                  error: (error) {
                    return const DashboardContainer(
                      text: 'Users',
                      number: 'Error',
                      isLoading: false,
                      image: AppImages.usersDrawer,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
