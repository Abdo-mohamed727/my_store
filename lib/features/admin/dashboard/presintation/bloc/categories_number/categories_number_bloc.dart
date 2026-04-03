import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/features/admin/dashboard/data/repo/dashboard_admin_repo.dart';

part 'categories_number_event.dart';
part 'categories_number_state.dart';
part 'categories_number_bloc.freezed.dart';

class CategoriesNumberBloc
    extends Bloc<CategoriesNumberEvent, CategoriesNumberState> {
  CategoriesNumberBloc(this._dashboardAdminRepo)
    : super(const CategoriesNumberState.loading()) {
    on<CategoriesNumberEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CategoriesNumberEvent>(_getCategoriesNumber);
  }

  final DashboardAdminRepo _dashboardAdminRepo;

  FutureOr<void> _getCategoriesNumber(
    CategoriesNumberEvent event,
    Emitter<CategoriesNumberState> emit,
  ) async {
    final result = await _dashboardAdminRepo.getCategoryNumber();
    result.when(
      success: (response) {
        emit(
          CategoriesNumberState.success(
            categoriesNumber: response.categoryNumber,
          ),
        );
      },
      failure: (error) {
        emit(CategoriesNumberState.error(errormessage: error));
      },
    );
  }
}
