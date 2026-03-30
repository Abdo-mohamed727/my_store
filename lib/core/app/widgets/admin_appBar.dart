import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';

class AdminAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppbar({
    required this.title,
    required this.backGroundColor,
    required this.ismain,
    super.key,
  });

  final String title;
  final Color backGroundColor;
  final bool ismain;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextApp(
        text: title,
        theme: context.textStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: backGroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: ismain
          ? IconButton(
              onPressed: () {
                ZoomDrawer.of(context)?.toggle();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
