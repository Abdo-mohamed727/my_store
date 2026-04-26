import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_family.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/coustomer/profile/data/models/profile_setting_item_model.dart';

class ProfileSettingTile extends StatelessWidget {
  const ProfileSettingTile({required this.item, super.key});

  final ProfileSettingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: InkWell(
        onTap: () {
          if (item.kind == ProfileSettingKind.language) {
            final appCubit = context.read<AppCubitCubit>();
            if (appCubit.currentLangCode == 'en') {
              appCubit.toArabic();
            } else {
              appCubit.toEnglish();
            }
          } else if (item.kind == ProfileSettingKind.darkMode) {
            context.read<AppCubitCubit>().changeThemeMode();
          }
        },
        child: Row(
          children: [
            Icon(_icon, color: ColorsDark.white, size: 28.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorsDark.white,
                  fontFamily: FontFamily.poppinsEnglish,
                  fontWeight: FontWeightHelper.mediaum,
                ),
              ),
            ),
            _TrailingView(item: item),
          ],
        ),
      ),
    );
  }

  IconData get _icon => switch (item.kind) {
    ProfileSettingKind.language => Icons.translate_rounded,
    ProfileSettingKind.darkMode => Icons.dark_mode_outlined,
    ProfileSettingKind.notifications => Icons.notifications_none_rounded,
    ProfileSettingKind.logout => Icons.logout_rounded,
  };
}

class _TrailingView extends StatelessWidget {
  const _TrailingView({required this.item});

  final ProfileSettingItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubitCubit, AppCubitState>(
      builder: (context, state) {
        final appCubit = context.read<AppCubitCubit>();
        
        if (item.trailingType == ProfileTrailingType.toggle) {
          final bool switchValue = item.kind == ProfileSettingKind.darkMode
              ? appCubit.isDark
              : (item.isEnabledVisualState ?? false);
              
          return Switch(
            value: switchValue,
            onChanged: (value) {
              if (item.kind == ProfileSettingKind.darkMode) {
                appCubit.changeThemeMode();
              }
            },
          );
        }
        
        String? displayValue = item.displayValue;
        if (item.kind == ProfileSettingKind.language) {
          displayValue = appCubit.currentLangCode == 'ar' ? 'العربية' : 'English';
        }
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (displayValue != null)
              Text(
                displayValue,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withValues(alpha: .88),
                  fontFamily: FontFamily.poppinsEnglish,
                ),
              ),
            SizedBox(width: 8.w),
            Icon(Icons.chevron_right_rounded, color: ColorsDark.white, size: 26.sp),
          ],
        );
      },
    );
  }
}
