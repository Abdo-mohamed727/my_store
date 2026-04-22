import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product_model.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductDetailsResponse product;

  const ProductInfoSection({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.data.productModel.title!,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            product.data.productModel.description!,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
