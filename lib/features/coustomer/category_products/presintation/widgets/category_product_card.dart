import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/coustomer/category_products/data/models/category_product_model.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({
    required this.product,
    required this.onTap,
    super.key,
  });

  final CategoryProductModel product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsDark.black1,
          borderRadius: BorderRadius.circular(16.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildImage()),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: TextStyle(
                      color: ColorsDark.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$ ${product.price?.toStringAsFixed(0) ?? '0'}',
                    style: TextStyle(
                      color: ColorsDark.blueLight,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final images = product.images;
    final imageUrl = images.isNotEmpty ? images.first : '';

    return SizedBox.expand(
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => const AppImageShimmer(),
              errorWidget: (_, __, ___) => const AppImageShimmer(),
            )
          : const AppImageShimmer(),
    );
  }
}
