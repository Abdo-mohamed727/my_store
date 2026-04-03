import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/dashboard/data/repo/dashboard_admin_repo.dart';

part 'users_number_event.dart';
part 'users_number_state.dart';
part 'users_number_bloc.freezed.dart';

class UsersNumberBloc extends Bloc<UsersNumberEvent, UsersNumberState> {
  UsersNumberBloc(this._dashboardAdminRepo)
    : super(const UsersNumberState.loading()) {
    on<UsersNumberEvent>((event, emit) {});
    on<UsersNumberEvent>(_getUsersNumber);
  }

  final DashboardAdminRepo _dashboardAdminRepo;

  FutureOr<void> _getUsersNumber(
    UsersNumberEvent event,
    Emitter<UsersNumberState> emit,
  ) async {
    final result = await _dashboardAdminRepo.getUsersNumber();
    result.when(
      success: (response) {
        emit(
          UsersNumberState.success(
            usersNumber: response.usersNumber,
          ),
        );
      },
      failure: (error) {
        emit(UsersNumberState.error(errormessage: error));
      },
    );
  }
}
