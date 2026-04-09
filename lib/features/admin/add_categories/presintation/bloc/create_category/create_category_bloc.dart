import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_categories/data/repo/add_categories_repo.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/create_category/create_category_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/create_category/create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._repo) : super(const CreateCategoryState.initial()) {
    on<CreateCategoryEvent>(_onEvent);
  }

  final AddCategoriesRepo _repo;

  Future<void> _onEvent(
    CreateCategoryEvent event,
    Emitter<CreateCategoryState> emit,
  ) async {
    await event.when(
      started: () async {},
      createCategory: (body) async => _createCategory(body: body, emit: emit),
    );
  }

  Future<void> _createCategory({
    required CreateCategoryRequestBody body,
    required Emitter<CreateCategoryState> emit,
  }) async {
    emit(const CreateCategoryState.loading());
    final result = await _repo.createCategory(body: body);
    result.when(
      success: (response) =>
          emit(CreateCategoryState.success(response: response)),
      failure: (error) => emit(CreateCategoryState.error(errorMessage: error)),
    );
  }
}
