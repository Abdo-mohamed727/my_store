import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/custom_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/add_products/presintation/widgets/add_product_bottom_sheet.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: 'Products',
            theme: context.textStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          CustomButton(
            backgroundColor: context.myColors.bluePinkDark,
            onPressed: () {
              showAddProductBottomSheet(context);
            },
            text: 'Add',
            width: 100.w,
            height: 35.h,
          ),
        ],
      ),
    );
  }
}