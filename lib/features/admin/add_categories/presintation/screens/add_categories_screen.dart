import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/refactors/add_categories_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<GetAllCategoriesBloc>()..add(const GetAllCategoriesEvent.fetch()),
      child: const Scaffold(
        appBar: AdminAppbar(
          title: 'Categories',
          backGroundColor: ColorsDark.mainColor,
          ismain: true,
        ),
        body: AddCategoriesBody(),
      ),
    );
  }
}
