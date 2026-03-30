import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/coustom_container_admin.dart';
import 'package:my_store/core/app/widgets/loading_shimmer.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/style/fonts/font_family.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    required this.text,
    required this.number,
    required this.isLoading,
    required this.image,
    super.key,
  });

  final String text;
  final String number;
  final bool isLoading;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 24, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: text,
                    theme: context.textStyle.copyWith(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamily.poppinsEnglish,
                    ),
                  ),
                  const Spacer(),
                  if (isLoading)
                    LoadingShimmer(
                      height: 30.h,
                      width: 120.w,
                    )
                  else
                    TextApp(
                      text: number,
                      theme: context.textStyle.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeightHelper.bold,
                        color: Colors.white,
                        fontFamily: FontFamily.poppinsEnglish,
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(image),
            ),
          ],
        ),
      ),
    );
  }
}
