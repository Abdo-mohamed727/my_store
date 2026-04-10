import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/admin/users/data/models/get_all_users_response.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/users/data/repo/users_repo.dart';
import 'package:my_store/features/admin/users/presintation/bloc/search_users/search_users_event.dart';
import 'package:my_store/features/admin/users/presintation/bloc/search_users/search_users_state.dart';

class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  SearchUsersBloc(this._repo) : super(const SearchUsersState.initial()) {
    on<FetchSearchUsersEvent>(_searchUsers);
  }

  final UsersRepo _repo;
  List<UsersModel>? _cachedUsers;

  FutureOr<void> _searchUsers(
    FetchSearchUsersEvent event,
    Emitter<SearchUsersState> emit,
  ) async {
    emit(const SearchUsersState.loading());

    if (_cachedUsers == null) {
      final result = await _repo.getAllUsers();
      result.when(
        success: (response) {
          _cachedUsers = response.data.usersList;
        },
        failure: (error) {
          emit(SearchUsersState.error(errorMessage: error));
        },
      );
    }

    if (_cachedUsers != null) {
      final query = event.name.toLowerCase();
      final filteredList = _cachedUsers!.where((user) {
        return user.name?.toLowerCase().contains(query) ?? false;
      }).toList();

      final responseBody = GetAllUsersResponse(UserData(filteredList));
      emit(SearchUsersState.success(response: responseBody));
    }
  }
}
