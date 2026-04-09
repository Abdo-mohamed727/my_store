import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart ';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/coustom_container_admin.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.name, required this.image, required this.id, super.key});

  final String name;
  final String image;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomContainerLinearAdmin(
        height: 150.h,
        width: double.infinity,

        child: Row(
          children: [
            Column(
              children: [
                TextApp(
                  text: name,
                  theme: context.textStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            CachedNetworkImage(
              imageUrl: image,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
