import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/dashboard/data/repo/dashboard_admin_repo.dart';

part 'products_number_event.dart';
part 'products_number_state.dart';
part 'products_number_bloc.freezed.dart';

class ProductsNumberBloc
    extends Bloc<ProductsNumberEvent, ProductsNumberState> {
  ProductsNumberBloc(this._dashboardAdminRepo)
    : super(const ProductsNumberState.loading()) {
    on<ProductsNumberEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ProductsNumberEvent>(_getProductsNumber);
  }

  final DashboardAdminRepo _dashboardAdminRepo;

  FutureOr<void> _getProductsNumber(
    ProductsNumberEvent event,
    Emitter<ProductsNumberState> emit,
  ) async {
    final result = await _dashboardAdminRepo.getProductsNumber();

    result.when(
      success: (response) {
        emit(
          ProductsNumberState.success(
            productsNumber: response.productsNumber,
          ),
        );
      },
      failure: (error) {
        emit(ProductsNumberState.error(errormessage: error));
      },
    );
  }
}
