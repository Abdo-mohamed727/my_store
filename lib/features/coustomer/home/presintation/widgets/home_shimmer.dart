import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsDark.black1,
      highlightColor: ColorsDark.black2.withOpacity(0.8),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner shimmer
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 160.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            SizedBox(height: 16.h),
            // Category shimmer
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 4,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (_, __) => Column(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      width: 50.w,
                      height: 10.h,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Product grid shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.72,
                ),
                itemCount: 4,
                itemBuilder: (_, __) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
