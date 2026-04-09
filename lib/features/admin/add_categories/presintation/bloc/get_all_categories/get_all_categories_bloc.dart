import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/repo/add_categories_repo.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_state.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc(this._repo)
    : super(const GetAllCategoriesState.initial()) {
    on<FetchGetAllCategoriesEvent>(_getAllCategories);
  }

  final AddCategoriesRepo _repo;

  FutureOr<void> _getAllCategories(
    FetchGetAllCategoriesEvent event,
    Emitter<GetAllCategoriesState> emit,
  ) async {
    emit(const GetAllCategoriesState.loading());
    final result = await _repo.getAllCategories();
    result.when(
      success: (response) {
        emit(GetAllCategoriesState.success(response: response));
      },
      failure: (error) {
        emit(GetAllCategoriesState.error(errorMessage: error));
      },
    );
  }
}
