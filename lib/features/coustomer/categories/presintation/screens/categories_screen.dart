import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/coustom_linear_button.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_family.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';

import 'package:my_store/features/coustomer/categories/presintation/bloc/categories_bloc.dart';
import 'package:my_store/features/coustomer/categories/presintation/bloc/categories_event.dart';
import 'package:my_store/features/coustomer/categories/presintation/bloc/categories_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_store/core/routes/app_routes.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CategoriesBloc>()..add(const FetchCategoriesEvent()),
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AppBar(
          backgroundColor: ColorsDark.mainColor,
          elevation: 0,
          title: Text(
            'Categories',
            style: TextStyle(
              color: ColorsDark.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: _CategoriesContent(),
        ),
      ),
    );
  }
}

class _CategoriesContent extends StatelessWidget {
  const _CategoriesContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (categories) {
            if (categories.isEmpty) {
              return const Center(
                child: Text('No categories available'),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.categoryProducts,
                      arguments: {
                        'categoryId': int.parse(category.id),
                        'categoryName': category.name,
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: category.image,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeightHelper.mediaum,
                              fontFamily: FontFamily.cairoArabic,
                              color: ColorsDark.blueDark,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message),
                SizedBox(height: 16.h),
                CustomLinearButton(
                  onPressed: () {
                    context.read<CategoriesBloc>().add(
                      const FetchCategoriesEvent(),
                    );
                  },
                  height: 40.h,
                  width: 120.w,
                  child: const Text(
                    'Retry',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
