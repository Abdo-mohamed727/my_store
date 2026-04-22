import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app/di/injection_container.dart';
import '../bloc/product_details_bloc.dart';
import '../bloc/product_details_event.dart';
import '../bloc/product_details_state.dart';
import '../widgets/product_details_background.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/product_info_section.dart';
import '../widgets/image_gallery_carousel.dart';
import '../widgets/sticky_add_to_cart_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({Key? key, required this.productId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>()
        ..add(ProductDetailsEvent.fetchProductDetails(productId: productId)),
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1D28),
        body: ProductDetailsBackground(
          child: SafeArea(
            bottom: false,
            child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: $message',
                          style: const TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ProductDetailsBloc>().add(
                              ProductDetailsEvent.fetchProductDetails(
                                productId: productId,
                              ),
                            );
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  success: (product) => Stack(
                    children: [
                      // Scrollable content
                      SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: 120.h,
                        ), // Space for sticky button
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomBackButton(),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        product.data.productModel.title!,
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 44.w), // Balance the row
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            ImageGalleryCarousel(
                              images: product.data.productModel.images ?? [],
                            ),
                            SizedBox(height: 20.h),
                            ProductInfoSection(product: product),
                          ],
                        ),
                      ),
                      // Sticky bottom button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: StickyAddToCartButton(
                          price: product.data.productModel.price!,
                          onAddPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${product.data.productModel.title} added to cart!',
                                ),
                                backgroundColor: const Color(0xFF3AC6F4),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
