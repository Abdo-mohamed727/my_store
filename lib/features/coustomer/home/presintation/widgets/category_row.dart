import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/category_chip.dart';
import 'package:my_store/core/routes/app_routes.dart';

class CategoryRow extends StatefulWidget {
  const CategoryRow({super.key, required this.categories});

  final List<ProductCategoryModel> categories;

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) => CategoryChip(
          category: widget.categories[index],
          isSelected: _selectedIndex == index,
          onTap: () {
            setState(() => _selectedIndex = index);
            Navigator.pushNamed(
              context,
              AppRoutes.categoryProducts,
              arguments: {
                'categoryId': int.tryParse(widget.categories[index].id) ?? 0,
                'categoryName': widget.categories[index].name,
              },
            );
          },
        ),
      ),
    );
  }
}
