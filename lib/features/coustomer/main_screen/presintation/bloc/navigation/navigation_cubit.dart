import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/coustomer/categories/presintation/screens/categories_screen.dart';
import 'package:my_store/features/coustomer/favourite/presintation/screens/coustomer_favourite_screen.dart';
import 'package:my_store/features/coustomer/home/presintation/screens/coustomer_home_page.dart';
import 'package:my_store/features/coustomer/products/presintation/screens/coustomer_products_screen.dart';
import 'package:my_store/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart';
import '../../../../../../core/utils/enums.dart';

class NavigationCubit extends Cubit<MainTab> {
  NavigationCubit() : super(MainTab.home);

  final List<Widget> screens = const [
    CoustomerHomePage(),
    CategoriesScreen(),
    CoustomerProductsScreen(),
    CoustomerFavouriteScreen(),
    CoustomerProfileScreen(),
  ];

  void setTab(MainTab tab) => emit(tab);

  void setTabByIndex(int index) => emit(MainTab.values[index]);
}
