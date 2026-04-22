import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';

class ImageGalleryCarousel extends StatefulWidget {
  final List<String> images;

  const ImageGalleryCarousel({Key? key, required this.images})
    : super(key: key);

  @override
  State<ImageGalleryCarousel> createState() => _ImageGalleryCarouselState();
}

class _ImageGalleryCarouselState extends State<ImageGalleryCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        Container(
          width: 300.w,
          height: 300.w,
          decoration: BoxDecoration(
            color: const Color(0xFFE2E2E2),
            borderRadius: BorderRadius.circular(16.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.images[index],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.broken_image_outlined)),
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        if (widget.images.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 4.h,
                width: 24.w,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? const Color(0xFF13D2F0)
                      : Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
