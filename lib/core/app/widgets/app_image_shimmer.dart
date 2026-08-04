import 'package:flutter/material.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:shimmer/shimmer.dart';

class AppImageShimmer extends StatelessWidget {
  const AppImageShimmer({
    super.key,
    this.baseColor = ColorsDark.black1,
    this.highlightColor = const Color(0x1FFFFBF0),
    this.backgroundColor = ColorsDark.black2,
  });

  final Color baseColor;
  final Color highlightColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ColoredBox(color: backgroundColor),
    );
  }
}
