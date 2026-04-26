import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/coustomer/category_products/presintation/bloc/category_products_bloc.dart';
import 'package:my_store/features/coustomer/category_products/presintation/bloc/category_products_state.dart';
import 'package:my_store/features/coustomer/category_products/presintation/widgets/category_product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    required this.categoryId,
    required this.categoryName,
    super.key,
  });

  final int categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AppBar(
        backgroundColor: ColorsDark.mainColor,
        title: Text(
          categoryName.isNotEmpty ? categoryName : 'Products',
          style: TextStyle(
            color: ColorsDark.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsDark.white),
      ),
      body: BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator(color: ColorsDark.blueLight)),
            success: (products) {
              if (products.isEmpty) {
                return Center(
                  child: Text(
                    'No products found in this category.',
                    style: TextStyle(color: ColorsDark.white, fontSize: 16.sp),
                  ),
                );
              }
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CategoryProductCard(
                    product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetails,
                        arguments: product.id,
                      );
                    },
                  );
                },
              );
            },
            error: (message) => Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.redAccent, fontSize: 16.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}
