import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/users/presintation/bloc/search_users/search_users_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/search_users/search_users_event.dart';
import 'package:my_store/features/admin/users/presintation/bloc/search_users/search_users_state.dart';
import 'package:my_store/features/admin/users/presintation/widgets/users_list_view.dart';
import 'package:my_store/features/admin/users/presintation/widgets/user_item.dart';
import 'package:my_store/features/admin/users/presintation/widgets/users_list_shimmer.dart';
import 'dart:async';

class SearchUsersView extends StatefulWidget {
  const SearchUsersView({super.key});

  @override
  State<SearchUsersView> createState() => _SearchUsersViewState();
}

class _SearchUsersViewState extends State<SearchUsersView> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  String? _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        context.read<SearchUsersBloc>().add(FetchSearchUsersEvent(name: query));
      } else {
        // Reset to initial state or let it show previous results?
        // Let's assume there's no "reset" event, but empty string means we don't search.
        // Actually, if it's empty, we should show the Get All Users view. Let's add a reset event or just manage it locally?
        // The simplest way without adding a reset event is to just keep track of if text is empty locally.
      }
    });
    setState(
      () {},
    ); // Trigger rebuild to show/hide UsersListView vs SearchUsersBloc
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: CustomTextField(
            controller: _searchController,
            hintText: 'Search Users by name...',
            onChanged: _onSearchChanged,
            prefixIcon: Icon(
              Icons.search,
              color: context.myColors.textColor,
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchUsersBloc, SearchUsersState>(
            builder: (context, state) {
              if (_searchController.text.isEmpty) {
                return const UsersListView();
              }

              return state.when(
                initial: () => Center(
                  child: Text(
                    'Searching...',
                    style: context.textStyle.copyWith(
                      color: context.myColors.textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                loading: () => const UsersListShimmer(),
                success: (response) {
                  final users = response.data.usersList;
                  if (users.isEmpty) {
                    return Center(
                      child: Text(
                        'No users found matching "${_searchController.text}".',
                        style: context.textStyle.copyWith(
                          color: context.myColors.textColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: users.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UserItem(user: users[index]);
                    },
                  );
                },
                error: (errorMessage) => Center(
                  child: Text(
                    errorMessage,
                    style: context.textStyle.copyWith(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
