import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';
import '../../data/repositories/product_details_repository_impl.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailsRepositoryImpl _repository;

  ProductDetailsBloc(this._repository)
    : super(const ProductDetailsState.initial()) {
    on<FetchProductDetailsEvent>(_getProductDetails);
  }

  FutureOr<void> _getProductDetails(
    FetchProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    try {
      final product = await _repository.getProductDetails(event.productId);
      emit(ProductDetailsState.success(product: product));
    } catch (error) {
      emit(ProductDetailsState.error(errorMessage: error.toString()));
    }
  }
}
