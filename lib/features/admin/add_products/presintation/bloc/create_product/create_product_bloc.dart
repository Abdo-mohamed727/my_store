import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:my_store/features/admin/add_products/data/repo/add_products_repo.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/create_product/create_product_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/create_product/create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc(this._repo) : super(const CreateProductState.initial()) {
    on<CreateProductEvent>(_onEvent);
  }

  final AddProductsRepo _repo;

  Future<void> _onEvent(
    CreateProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    await event.when(
      started: () async {},
      createProduct: (body) async => _createProduct(body: body, emit: emit),
    );
  }

  Future<void> _createProduct({
    required CreateProductRequestBody body,
    required Emitter<CreateProductState> emit,
  }) async {
    emit(const CreateProductState.loading());
    final result = await _repo.createProduct(body);
    result.when(
      success: (response) =>
          emit(CreateProductState.success(response: response)),
      failure: (error) => emit(CreateProductState.error(errorMessage: error)),
    );
  }
}
