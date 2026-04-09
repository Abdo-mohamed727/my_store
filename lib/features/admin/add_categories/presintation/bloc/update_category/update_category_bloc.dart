import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/repo/add_categories_repo.dart';
import 'package:my_store/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/update_category/update_category_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/update_category/update_category_state.dart';

class UpdateCategoryBloc
    extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  UpdateCategoryBloc(this._repo) : super(const UpdateCategoryState.initial()) {
    on<UpdateCategoryEvent>(_onEvent);
  }

  final AddCategoriesRepo _repo;

  Future<void> _onEvent(
    UpdateCategoryEvent event,
    Emitter<UpdateCategoryState> emit,
  ) async {
    await event.when(
      started: () async {},
      updateCategory: (body) async => _updateCategory(body: body, emit: emit),
    );
  }

  Future<void> _updateCategory({
    required UpdateCategoryRequestBody body,
    required Emitter<UpdateCategoryState> emit,
  }) async {
    emit(const UpdateCategoryState.loading());
    final result = await _repo.updateCategory(body: body);
    result.when(
      success: (response) =>
          emit(UpdateCategoryState.success(response: response)),
      failure: (error) => emit(UpdateCategoryState.error(errorMessage: error)),
    );
  }
}
