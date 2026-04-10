import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_bloc.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_event.dart';
class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({required this.user, super.key});

  final UsersModel user;

  @override
  Widget build(BuildContext context) {
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
