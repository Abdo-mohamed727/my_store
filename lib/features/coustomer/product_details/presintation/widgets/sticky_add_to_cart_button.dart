import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickyAddToCartButton extends StatelessWidget {
  final double price;
  final VoidCallback onAddPressed;

  const StickyAddToCartButton({
    Key? key,
    required this.price,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFF242735),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ ${price.toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF13D2F0), // Cyan text
              ),
            ),
            InkWell(
              onTap: onAddPressed,
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF4C5BF8), // Blue
                      Color(0xFF1CD5ED), // Cyan
                    ],
                  ),
                ),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
