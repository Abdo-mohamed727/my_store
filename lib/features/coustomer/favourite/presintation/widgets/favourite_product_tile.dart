import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';

class FavouriteProductTile extends StatelessWidget {
  const FavouriteProductTile({
    required this.product,
    required this.onRemove,
    super.key,
  });

  final FavouriteModel product;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: ColorsDark.black1,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 82.w,
              height: 82.w,
              child: _buildImage(),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title.isNotEmpty ? product.title : 'Untitled',
                  style: TextStyle(
                    color: ColorsDark.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  product.categoryName,
                  style: TextStyle(
                    color: ColorsDark.blueLight,
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  '\$ ${product.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: ColorsDark.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.favorite),
            color: Colors.redAccent,
            tooltip: 'Remove favourite',
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (product.image.startsWith('assets/')) {
      return Image.asset(
        product.image,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const AppImageShimmer(),
      );
    }

    if (product.image.isEmpty) {
      return const AppImageShimmer();
    }

    return CachedNetworkImage(
      imageUrl: product.image,
      fit: BoxFit.cover,
      placeholder: (_, __) => const AppImageShimmer(),
      errorWidget: (_, __, ___) => const AppImageShimmer(),
    );
  }
}
