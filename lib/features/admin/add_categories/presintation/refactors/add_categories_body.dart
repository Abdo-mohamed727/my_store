import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/custom_button.dart';
import 'package:my_store/core/app/widgets/loading_shimmer.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_state.dart';
import 'package:my_store/features/admin/add_categories/presintation/widgets/category_item.dart';
import 'package:my_store/features/admin/add_categories/presintation/widgets/create_category.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateCategory(),
        SizedBox(height: 20.h),
        Expanded(
          child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (response) {
                  final categories = response.data.totalCategorys;
                  if (categories.isEmpty) {
                    return const Center(child: Text("No Categories found"));
                  }
                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryItem(
                        name: category.name ?? 'No Name',
                        image:
                            category.image ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFkSUMfmtGznnDJEVVM-Fwo3Gf-qvsK4KzdA&s',
                        id: category.id ?? '',
                      );
                    },
                  );
                },
                error: (errorMessage) => Center(child: Text(errorMessage)),
              );
            },
          ),
        ),
      ],
    );
  }
}
