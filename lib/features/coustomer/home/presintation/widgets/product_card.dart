import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onShare,
    required this.onTap,
    super.key,
  });

  final ProductGetAllModel product;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onShare;
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
            _buildActionRow(),
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
                    product.category?.name ?? '',
                    style: TextStyle(
                      color: ColorsDark.blueLight,
                      fontSize: 11.sp,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$ ${product.price?.toStringAsFixed(0) ?? '0'}',
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
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onShare,
            child: Icon(
              Icons.share_outlined,
              color: ColorsDark.white,
              size: 20.w,
            ),
          ),
          GestureDetector(
            onTap: onFavoriteToggle,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                key: ValueKey(isFavorite),
                color: isFavorite ? Colors.redAccent : ColorsDark.white,
                size: 20.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    final images = product.images ?? [];
    final imageUrl = images.isNotEmpty ? images.first : '';

    if (imageUrl.startsWith('assets/')) {
      return SizedBox.expand(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const AppImageShimmer(),
        ),
      );
    }

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
