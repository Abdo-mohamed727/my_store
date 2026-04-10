import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/add_products/data/repo/add_products_repo.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(this._repo)
      : super(const GetAllProductsState.initial()) {
    on<FetchGetAllProductsEvent>(_getAllProducts);
  }

  final AddProductsRepo _repo;

  FutureOr<void> _getAllProducts(
    FetchGetAllProductsEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(const GetAllProductsState.loading());
    final result = await _repo.getAllProducts();
    result.when(
      success: (response) {
        emit(GetAllProductsState.success(response: response));
      },
      failure: (error) {
        emit(GetAllProductsState.error(errorMessage: error));
      },
    );
  }
}
