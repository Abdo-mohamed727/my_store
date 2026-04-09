import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_event.dart';
import 'package:my_store/features/admin/add_products/presintation/refactors/add_products_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<GetAllProductsBloc>()..add(const GetAllProductsEvent.fetch()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetAllCategoriesBloc>()..add(const GetAllCategoriesEvent.fetch()),
        ),
      ],
      child: const Scaffold(
        appBar: AdminAppbar(
          title: 'Products',
          backGroundColor: ColorsDark.mainColor,
          ismain: true,
        ),
        body: AddProductsBody(),
      ),
    );
  }
}
