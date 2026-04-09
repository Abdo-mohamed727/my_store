import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/custom_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/add_categories/presintation/widgets/add_category_bottom_sheet.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: 'Add Categories',
            theme: context.textStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          CustomButton(
            backgroundColor: context.myColors.bluePinkDark,
            onPressed: () {
              showAddCategoryBottomSheet(context);
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
