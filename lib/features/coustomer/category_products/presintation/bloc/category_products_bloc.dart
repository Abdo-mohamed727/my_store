import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/coustomer/category_products/domain/repositories/category_products_repository.dart';
import 'package:my_store/features/coustomer/category_products/presintation/bloc/category_products_event.dart';
import 'package:my_store/features/coustomer/category_products/presintation/bloc/category_products_state.dart';

class CategoryProductsBloc
    extends Bloc<CategoryProductsEvent, CategoryProductsState> {
  CategoryProductsBloc(this._repository)
    : super(const CategoryProductsState.initial()) {
    on<CategoryProductsEvent>((event, emit) async {
      await event.map(
        started: (_) async {},
        fetchProducts: (e) async {
          emit(const CategoryProductsState.loading());
          final result = await _repository.getProductsByCategory(e.categoryId);
          result.when(
            success: (products) =>
                emit(CategoryProductsState.success(products)),
            failure: (message) => emit(CategoryProductsState.error(message)),
          );
        },
      );
    });
  }

  final CategoryProductsRepository _repository;
}
