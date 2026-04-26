import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/coustomer/categories/data/repositories/categories_repository.dart';
import 'package:my_store/features/coustomer/categories/presintation/bloc/categories_event.dart';
import 'package:my_store/features/coustomer/categories/presintation/bloc/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this._repo) : super(const CategoriesState.initial()) {
    on<FetchCategoriesEvent>(_fetchCategories);
  }

  final CategoriesRepository _repo;

  FutureOr<void> _fetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(const CategoriesState.loading());
    final result = await _repo.getAllCategories();
    result.when(
      success: (categories) {
        emit(CategoriesState.success(categories: categories));
      },
      failure: (error) {
        emit(CategoriesState.error(errorMessage: error));
      },
    );
  }
}
