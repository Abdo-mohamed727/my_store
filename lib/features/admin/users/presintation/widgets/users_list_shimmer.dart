import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/loading_shimmer.dart';

class UsersListShimmer extends StatelessWidget {
  const UsersListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) => const _UserShimmerItem(),
    );
  }
}

class _UserShimmerItem extends StatelessWidget {
  const _UserShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          LoadingShimmer(height: 50.h, width: 50.w, borderRadius: 25),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingShimmer(height: 18.h, width: 120.w, borderRadius: 6),
                SizedBox(height: 8.h),
                LoadingShimmer(height: 14.h, width: 160.w, borderRadius: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
