import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class CustomerSearchScreen extends StatelessWidget {
  const CustomerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AppBar(
        backgroundColor: ColorsDark.navBarDark,
        title: Text(
          'Search Products',
          style: TextStyle(
            color: ColorsDark.white,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_rounded,
                color: ColorsDark.blueLight.withOpacity(0.4), size: 80.w),
            SizedBox(height: 16.h),
            Text(
              'Search coming soon',
              style: TextStyle(
                color: ColorsDark.white.withOpacity(0.6),
                fontSize: 15.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
