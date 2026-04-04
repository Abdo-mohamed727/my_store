import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/categories_number/categories_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/products_number/products_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/users_number/users_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/refactors/dashboard_admin_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<ProductsNumberBloc>()
                ..add(const ProductsNumberEvent.getProductsNumber()),
        ),
        BlocProvider(
          create: (context) =>
              sl<UsersNumberBloc>()
                ..add(const UsersNumberEvent.getUsersNumber()),
        ),
        BlocProvider(
          create: (context) =>
              sl<CategoriesNumberBloc>()
                ..add(const CategoriesNumberEvent.getCategoriesNumber()),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppbar(
          title: 'DashBoard',
          backGroundColor: ColorsDark.mainColor,
          ismain: true,
        ),
        body: DashboardAdminBody(),
      ),
    );
  }
}
