import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_event.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_state.dart';
import 'package:my_store/features/admin/users/presintation/widgets/user_item.dart';
import 'package:my_store/features/admin/users/presintation/widgets/users_list_shimmer.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllUsersBloc>().add(const FetchGetAllUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        return state.when(
          initial: () => const UsersListShimmer(),
          loading: () => const UsersListShimmer(),
          success: (response) {
            final users = response.data.usersList;
            if (users.isEmpty) {
              return const Center(child: Text('No users found.'));
            }
            return ListView.builder(
              itemCount: users.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return UserItem(user: users[index]);
              },
            );
          },
          error: (errorMessage) => Text(
            errorMessage,
            style: context.textStyle.copyWith(
              color: Colors.red,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
