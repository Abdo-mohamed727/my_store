import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/navigation/navigation_cubit.dart';
import '../../../../../../core/utils/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, MainTab>(
      builder: (context, currentTab) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(MainTab.values.length, (index) {
                final tab = MainTab.values[index];
                final isSelected = currentTab.index == index;
                return _NavBarItem(
                  tab: tab,
                  isSelected: isSelected,
                  onTap: () {
                    context.read<NavigationCubit>().setTabByIndex(index);
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final MainTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String label;

    switch (tab) {
      case MainTab.home:
        icon = isSelected ? Icons.home : Icons.home_outlined;
        label = 'Home';
        break;
      case MainTab.category:
        icon = isSelected ? Icons.category : Icons.category_outlined;
        label = 'Category';
        break;
      case MainTab.product:
        icon = isSelected ? Icons.shopping_bag : Icons.shopping_bag_outlined;
        label = 'Product';
        break;
      case MainTab.favorites:
        icon = isSelected ? Icons.favorite : Icons.favorite_outline;
        label = 'Favorites';
        break;
      case MainTab.profile:
        icon = isSelected ? Icons.person : Icons.person_outline;
        label = 'Profile';
        break;
    }

    final activeColor = Theme.of(context).primaryColor;
    final inactiveColor = Colors.grey;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuint,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16.w : 12.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                icon,
                key: ValueKey(icon),
                color: isSelected ? activeColor : inactiveColor,
                size: 24.w,
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuint,
              child: isSelected
                  ? Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: Text(
                        label,
                        style: TextStyle(
                          color: activeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
