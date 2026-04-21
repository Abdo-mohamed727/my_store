import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final ProductCategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorsDark.blueDark.withOpacity(0.2)
                  : ColorsDark.black1,
              borderRadius: BorderRadius.circular(14.r),
              border: isSelected
                  ? Border.all(color: ColorsDark.blueDark, width: 2)
                  : null,
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildImage(),
          ),
          SizedBox(height: 6.h),
          Text(
            category.name,
            style: TextStyle(
              color: isSelected ? ColorsDark.blueLight : ColorsDark.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    final url = category.imageUrl;
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const AppImageShimmer(),
      );
    }
    return url.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: (_, __) => const AppImageShimmer(),
            errorWidget: (_, __, ___) => const AppImageShimmer(),
          )
        : const AppImageShimmer();
  }
}
