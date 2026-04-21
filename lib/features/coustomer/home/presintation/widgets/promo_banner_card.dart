import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';

class PromoBannerCard extends StatelessWidget {
  const PromoBannerCard({super.key, required this.banner});

  final PromoBannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    return SizedBox.expand(
      child: Image.asset(
        banner.imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const AppImageShimmer(),
      ),
    );
  }
}
