import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/features/coustomer/favourite/presintation/bloc/favourite_cubit.dart';
import '../bloc/navigation/navigation_cubit.dart';
import '../../../../../../core/utils/enums.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteCubit = sl<FavouriteCubit>();
    unawaited(favouriteCubit.ensureLoaded());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationCubit(),
        ),
        BlocProvider.value(
          value: favouriteCubit,
        ),
      ],
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, MainTab>(
        builder: (context, currentTab) {
          return IndexedStack(
            index: currentTab.index,
            children: context.read<NavigationCubit>().screens,
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
