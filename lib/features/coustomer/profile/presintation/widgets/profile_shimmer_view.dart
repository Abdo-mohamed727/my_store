import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmerView extends StatelessWidget {
  const ProfileShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsDark.black1,
      highlightColor: ColorsDark.black2,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(24.w, 70.h, 24.w, 40.h),
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) return _HeaderPlaceholder();
          return Container(
            height: 28.h,
            margin: EdgeInsets.only(bottom: 26.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 116.r,
          height: 116.r,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 20.h),
        Container(width: 130.w, height: 24.h, color: Colors.white),
        SizedBox(height: 12.h),
        Container(width: 180.w, height: 18.h, color: Colors.white),
        SizedBox(height: 44.h),
      ],
    );
  }
}
