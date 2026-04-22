import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3AC6F4), // Cyan
              Color(0xFF3B48F6), // Blue
            ],
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 18.sp,
        ),
      ),
    );
  }
}
