import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';
import 'package:my_store/features/admin/users/data/repo/users_repo.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_event.dart';
import 'package:my_store/features/admin/users/presintation/bloc/get_all_users/get_all_users_state.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this._repo) : super(const GetAllUsersState.initial()) {
    on<FetchGetAllUsersEvent>(_getAllUsers);
  }

  final UsersRepo _repo;

  List<UsersModel> usersList = [];

  FutureOr<void> _getAllUsers(
    FetchGetAllUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    emit(const GetAllUsersState.loading());
    final result = await _repo.getAllUsers();
    result.when(
      success: (response) {
        usersList = response.data.usersList;
        emit(GetAllUsersState.success(response: response));
      },
      failure: (error) {
        emit(GetAllUsersState.error(errorMessage: error));
      },
    );
  }
}
