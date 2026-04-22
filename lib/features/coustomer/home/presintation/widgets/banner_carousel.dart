import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/coustomer/home/data/models/promo_banner_model.dart';
import 'package:my_store/features/coustomer/home/presintation/widgets/promo_banner_card.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBannerModel> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || widget.banners.length <= 1) return;
      final next = (_currentPage + 1) % widget.banners.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: widget.banners.length > 1 ? 152.h : 132.h,
      child: Stack(
        children: [
          SizedBox(
            height: 132.h,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.banners.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) =>
                  PromoBannerCard(banner: widget.banners[index]),
            ),
          ),
          if (widget.banners.length > 1)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildDotIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.banners.length, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          width: isActive ? 20.w : 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: isActive
                ? ColorsDark.blueDark
                : ColorsDark.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(3.r),
          ),
        );
      }),
    );
  }
}
