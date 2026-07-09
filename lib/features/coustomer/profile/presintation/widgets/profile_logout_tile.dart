import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/dialogs/custom_dialog.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/core/style/fonts/font_family.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/coustomer/profile/data/models/profile_setting_item_model.dart';

class ProfileLogoutTile extends StatelessWidget {
  const ProfileLogoutTile({required this.item, super.key});

  final ProfileSettingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: InkWell(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Are you sure you want to log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,

            onPressed: () async {
              final navigator = Navigator.of(context);
              await SharedPref().removePreference(ShareKeys.accesstoken);
              await SharedPref().removePreference(ShareKeys.refreshtoken);
              await SharedPref().removePreference(ShareKeys.userId);
              await navigator.pushNamedAndRemoveUntil(
                AppRoutes.loginpage,
                (route) => false,
              );
            },
          );
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.redAccent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.redAccent.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.logout_rounded, color: Colors.redAccent, size: 28.sp),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.redAccent,
                    fontFamily: FontFamily.poppinsEnglish,
                    fontWeight: FontWeightHelper.mediaum,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
