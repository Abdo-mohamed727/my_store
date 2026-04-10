import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/widgets/update_product_form.dart';
import 'package:my_store/core/app/widgets/text_app.dart';

class UpdateProductBottomSheet extends StatelessWidget {
  const UpdateProductBottomSheet({required this.product, super.key});

  final ProductGetAllModel product;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: TextApp(
                  text: 'Update Product',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              UpdateProductForm(product: product),
            ],
          ),
        ),
      ),
    );
  }
}

void showUpdateProductBottomSheet(
  BuildContext context,
  ProductGetAllModel product,
) {
  final getAllProductsBloc = context.read<GetAllProductsBloc>();
  final getAllCategoriesBloc = context.read<GetAllCategoriesBloc>();

  showModalBottomSheet<Widget>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.myColors.mainColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<UploadImageCubit>()),
          BlocProvider(create: (context) => sl<UpdateProductBloc>()),
          BlocProvider.value(value: getAllCategoriesBloc),
          BlocProvider.value(value: getAllProductsBloc),
        ],
        child: UpdateProductBottomSheet(product: product),
      );
    },
  );
}
