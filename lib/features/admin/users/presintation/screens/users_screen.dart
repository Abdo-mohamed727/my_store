import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/admin_appBar.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/search_users/search_users_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_bloc.dart';
import 'package:my_store/features/admin/users/presintation/widgets/search_users_view.dart';
import 'package:my_store/features/admin/users/presintation/widgets/users_list_view.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppbar(
        title: 'Users',
        backGroundColor: ColorsDark.mainColor,
        ismain: true,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<GetAllUsersBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<SearchUsersBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<DeleteUserBloc>(),
          ),
        ],
        child: const SearchUsersView(),
      ),
    );
  }
}
