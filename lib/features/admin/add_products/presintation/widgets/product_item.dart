import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/core/app/widgets/coustom_container_admin.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/admin/add_products/presintation/refactors/update_product_bottom_sheet.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.product,
    super.key,
  });

  final ProductGetAllModel product;

  @override
  Widget build(BuildContext context) {
    final imageUrl = (product.images?.isNotEmpty ?? false)
        ? product.images!.first
        : '';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: GestureDetector(
        onTap: () => showUpdateProductBottomSheet(context, product),
        child: CustomContainerLinearAdmin(
          height: 150.h,
          width: double.infinity,
          child: _ProductItemContent(
            product: product,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}

class _ProductItemContent extends StatelessWidget {
  const _ProductItemContent({
    required this.product,
    required this.imageUrl,
  });

  final ProductGetAllModel product;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _ProductInfo(product: product)),
        _ProductImage(imageUrl: imageUrl),
      ],
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.product});

  final ProductGetAllModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: product.title ?? 'No Title',
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6.h),
          TextApp(
            text: '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              color: Colors.greenAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
          TextApp(
            text: product.category?.name ?? 'No Category',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: 120.w,
              height: 150.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => const AppImageShimmer(),
              errorWidget: (context, url, error) => const AppImageShimmer(),
            )
          : const SizedBox(
              width: 120,
              child: AppImageShimmer(),
            ),
    );
  }
}
