import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/theme/color_extension.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_event.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_state.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_event.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});

  final UsersModel user;

  @override
  Widget build(BuildContext context) {
    final userbloc = context.read<GetAllUsersBloc>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.dark.bluePinkDark,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: ColorsDark.mainColor,
            child: Text(
              user.name?.isNotEmpty == true ? user.name![0].toUpperCase() : '?',
              style: context.textStyle.copyWith(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? 'Unknown User',
                  style: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  user.email ?? 'No Email',
                  style: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsDark.blueLight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          BlocConsumer<DeleteUserBloc, DeleteUserState>(
            listenWhen: (previous, current) => current.maybeWhen(
              success: (userId) => userId == user.id,
              error: (_) => true,
              orElse: () => false,
            ),
            listener: (context, state) {
              state.whenOrNull(
                success: (userId) {
                  if (userId == user.id) {
                    context.read<GetAllUsersBloc>().add(
                      const FetchGetAllUsersEvent(),
                    );
                  }
                },
                error: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: (id) => id == user.id
                    ? SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.red,
                        ),
                      )
                    : _buildDeleteIcon(context),
                orElse: () => _buildDeleteIcon(context),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        if (user.id != null) {
          context.read<DeleteUserBloc>().add(
            DeleteUserEvent.deleteUser(userId: user.id!),
          );
        }
      },
    );
  }
}
