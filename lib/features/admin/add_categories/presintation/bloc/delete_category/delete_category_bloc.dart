import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/repo/add_categories_repo.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/delete_category/delete_category_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/delete_category/delete_category_state.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._repo) : super(const DeleteCategoryState.initial()) {
    on<DeleteCategoryEvent>(_onEvent);
  }

  final AddCategoriesRepo _repo;

  Future<void> _onEvent(
    DeleteCategoryEvent event,
    Emitter<DeleteCategoryState> emit,
  ) async {
    await event.when(
      started: () async {},
      deleteCategory: (id) async => _deleteCategory(id: id, emit: emit),
    );
  }

  Future<void> _deleteCategory({
    required String id,
    required Emitter<DeleteCategoryState> emit,
  }) async {
    emit(const DeleteCategoryState.loading());
    final result = await _repo.deleteCategory(id: id);
    result.when(
      success: (_) => emit(const DeleteCategoryState.success()),
      failure: (error) => emit(DeleteCategoryState.error(errorMessage: error)),
    );
  }
}
