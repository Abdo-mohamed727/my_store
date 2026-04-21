import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({
    super.key,
    this.message = 'No products available right now.',
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              color: ColorsDark.blueLight.withOpacity(0.5),
              size: 80.w,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsDark.white.withOpacity(0.7),
                fontSize: 15.sp,
                fontFamily: 'Poppins',
              ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsDark.blueDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.w, vertical: 12.h),
                ),
                child: Text(
                  'Retry',
                  style: TextStyle(
                    color: ColorsDark.white,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
