import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/users/data/repo/users_repo.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_event.dart';
import 'package:my_store/features/admin/users/presintation/bloc/delete_user/delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  DeleteUserBloc(this._repo) : super(const DeleteUserState.initial()) {
    on<RemoveUserEvent>(_deleteUser);
  }

  final UsersRepo _repo;

  FutureOr<void> _deleteUser(
    RemoveUserEvent event,
    Emitter<DeleteUserState> emit,
  ) async {
    emit(DeleteUserState.loading(userId: event.userId));
    final result = await _repo.deleteUser(id: event.userId);
    result.when(
      success: (_) {
        emit(DeleteUserState.success(userId: event.userId));
      },
      failure: (error) {
        emit(DeleteUserState.error(error: error));
      },
    );
  }
}
