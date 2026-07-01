import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/coustomer/favourite/presintation/bloc/favourite_cubit.dart';
import 'package:my_store/features/coustomer/favourite/presintation/bloc/favourite_state.dart';
import 'package:my_store/features/coustomer/favourite/presintation/widgets/favourite_product_tile.dart';

class CoustomerFavouriteScreen extends StatelessWidget {
  const CoustomerFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AppBar(
        backgroundColor: ColorsDark.mainColor,
        foregroundColor: ColorsDark.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favourite',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<FavouriteCubit>().ensureLoaded();
              return const Center(child: CircularProgressIndicator());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (favourites, _) {
              if (favourites.isEmpty) {
                return const _EmptyFavouriteState();
              }

              return ListView.separated(
                padding: EdgeInsets.all(16.r),
                itemCount: favourites.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final product = favourites[index];
                  return FavouriteProductTile(
                    product: product,
                    onRemove: () => context
                        .read<FavouriteCubit>()
                        .removeFavourite(product.id),
                  );
                },
              );
            },
            error: (message) => _FavouriteErrorState(
              message: message,
              onRetry: () => context.read<FavouriteCubit>().loadFavourites(),
            ),
          );
        },
      ),
    );
  }
}

class _EmptyFavouriteState extends StatelessWidget {
  const _EmptyFavouriteState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border,
              color: ColorsDark.blueLight,
              size: 54.w,
            ),
            SizedBox(height: 16.h),
            Text(
              'No favourite products yet',
              style: TextStyle(
                color: ColorsDark.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Tap the heart on any product to save it here.',
              style: TextStyle(
                color: ColorsDark.white.withOpacity(0.7),
                fontSize: 13.sp,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FavouriteErrorState extends StatelessWidget {
  const _FavouriteErrorState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: TextStyle(
                color: ColorsDark.white,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
