import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation/navigation_cubit.dart';
import '../../../../../../core/utils/enums.dart';
import '../widgets/custom_bottom_nav_bar.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
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
