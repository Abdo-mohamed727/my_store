import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';
import 'package:my_store/features/coustomer/favourite/presintation/bloc/favourite_cubit.dart';
import 'package:my_store/features/coustomer/favourite/presintation/bloc/favourite_state.dart';
import 'package:my_store/features/coustomer/home/data/models/product_category_model.dart';
import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/presintation/bloc/home/home_cubit.dart';
import 'package:my_store/features/coustomer/home/presintation/bloc/home/home_state.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/banner_carousel.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/category_row.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/home_background_painter.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/home_empty_state.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/home_header.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/home_shimmer.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/product_card.dart';

class CoustomerHomePage extends StatefulWidget {
  const CoustomerHomePage({super.key});

  @override
  State<CoustomerHomePage> createState() => _CoustomerHomePageState();
}

class _CoustomerHomePageState extends State<CoustomerHomePage> {
  late final ScrollController _scrollController;
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    final shouldShow = _scrollController.offset > 250;
    if (shouldShow != _showScrollToTop) {
      setState(() => _showScrollToTop = shouldShow);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = sl<HomeCubit>();
        unawaited(cubit.loadHomeData());
        return cubit;
      },
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        body: Stack(
          children: [
            const Positioned.fill(child: HomeBackgroundPainter()),
            SafeArea(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const HomeShimmer(),
                    loading: () => const HomeShimmer(),
                    loaded: (banners, categories, products, _) =>
                        _buildLoadedContent(
                          context,
                          banners: banners,
                          categories: categories,
                          products: products,
                        ),
                    error: (message) => HomeEmptyState(
                      message: message,
                      onRetry: () => context.read<HomeCubit>().loadHomeData(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          offset: _showScrollToTop ? Offset.zero : const Offset(0, 2),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showScrollToTop ? 1.0 : 0.0,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: ColorsDark.blueDark,
              onPressed: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: ColorsDark.white,
                size: 24.w,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(
    BuildContext context, {
    required List<PromoBannerModel> banners,
    required List<ProductCategoryModel> categories,
    required List<ProductGetAllModel> products,
  }) {
    if (products.isEmpty) {
      return HomeEmptyState(
        onRetry: () => context.read<HomeCubit>().loadHomeData(),
      );
    }

    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: HomeHeader(
            onSearchTap: () =>
                Navigator.pushNamed(context, AppRoutes.customerSearch),
          ),
        ),

        if (banners.isNotEmpty)
          SliverToBoxAdapter(
            child: BannerCarousel(banners: List.from(banners)),
          ),

        SliverToBoxAdapter(child: SizedBox(height: 20.h)),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Categories',
              style: TextStyle(
                color: ColorsDark.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12.h)),

        if (categories.isNotEmpty)
          SliverToBoxAdapter(
            child: CategoryRow(categories: List.from(categories)),
          ),

        SliverToBoxAdapter(child: SizedBox(height: 20.h)),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Featured Products',
              style: TextStyle(
                color: ColorsDark.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12.h)),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.68,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = products[index];
                return BlocSelector<FavouriteCubit, FavouriteState, bool>(
                  selector: (state) => state.maybeWhen(
                    loaded: (_, favouriteProductIds) =>
                        favouriteProductIds.contains(product.id ?? ''),
                    orElse: () => false,
                  ),
                  builder: (context, isFav) {
                    return ProductCard(
                      product: product,
                      isFavorite: isFav,
                      onFavoriteToggle: () => unawaited(
                        context.read<FavouriteCubit>().toggleFavourite(
                          FavouriteModel.fromProduct(product),
                        ),
                      ),
                      onTap: () {
                        unawaited(
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productDetails,
                            arguments: product.id ?? '',
                          ),
                        );
                      },
                    );
                  },
                );
              },
              childCount: products.length,
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      ],
    );
  }
}
