import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onSearchTap});

  final VoidCallback onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Choose Your Products',
            style: TextStyle(
              color: ColorsDark.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: ColorsDark.blueDark,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.search_rounded,
                color: ColorsDark.white,
                size: 22.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
