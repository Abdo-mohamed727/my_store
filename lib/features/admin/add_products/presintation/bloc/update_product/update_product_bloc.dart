import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_products/data/repo/add_products_repo.dart';
import 'package:my_store/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/update_product/update_product_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/update_product/update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc(this._repo) : super(const UpdateProductState.initial()) {
    on<UpdateProductEvent>(_onEvent);
  }

  final AddProductsRepo _repo;

  Future<void> _onEvent(
    UpdateProductEvent event,
    Emitter<UpdateProductState> emit,
  ) async {
    await event.when(
      started: () async {},
      updateProduct: (body) async => _updateProduct(body: body, emit: emit),
    );
  }

  Future<void> _updateProduct({
    required UpdateProductRequestBody body,
    required Emitter<UpdateProductState> emit,
  }) async {
    emit(const UpdateProductState.loading());
    final result = await _repo.updateProduct(body: body);
    result.when(
      success: (response) =>
          emit(UpdateProductState.success(response: response)),
      failure: (error) => emit(UpdateProductState.error(errorMessage: error)),
    );
  }
}
