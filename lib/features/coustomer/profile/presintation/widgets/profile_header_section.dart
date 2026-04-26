import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_family.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    required this.summary,
    required this.isFallback,
    super.key,
  });

  final UserRoleResponse summary;
  final bool isFallback;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CircleAvatar(
          radius: 58.r,
          backgroundColor: Colors.white,
          backgroundImage: summary.avatar == null
              ? null
              : NetworkImage(summary.avatar!),
          child: summary.avatar == null
              ? Text(_fallbackInitials, style: textTheme.headlineSmall)
              : null,
        ),
        SizedBox(height: 18.h),
        Text(
          summary.name ?? 'Guest User',
          style: textTheme.headlineSmall?.copyWith(
            color: ColorsDark.white,
            fontFamily: FontFamily.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          summary.email ?? 'Contact info unavailable',
          style: textTheme.titleMedium?.copyWith(
            color: isFallback ? Colors.white70 : ColorsDark.white,
            fontFamily: FontFamily.poppinsEnglish,
          ),
        ),
      ],
    );
  }

  String get _fallbackInitials {
    final name = summary.name;
    if (name == null || name.trim().isEmpty) {
      return 'GU';
    }
    final parts = name.trim().split(RegExp(r'\s+'));
    final letters = parts.take(2).map((part) => part[0]).join();
    return letters.toUpperCase();
  }
}
