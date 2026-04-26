import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/coustomer/profile/data/datasources/profile_local_data_source.dart';
import 'package:my_store/features/coustomer/profile/presintation/bloc/profile_event.dart';
import 'package:my_store/features/coustomer/profile/presintation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._dataSource) : super(const ProfileState.initial()) {
    on<ProfileStartedEvent>(_loadProfile);
    on<ProfileRetryRequestedEvent>(_loadProfile);
  }

  final ProfileLocalDataSource _dataSource;

  FutureOr<void> _loadProfile(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      final summary = await _dataSource.fetchProfileSummary();
      final sections = await _dataSource.fetchSections();
      final hasFallback = summary.avatar == null || summary.name == null;
      emit(
        hasFallback
            ? ProfileState.fallback(summary: summary, sections: sections)
            : ProfileState.content(summary: summary, sections: sections),
      );
    } catch (error) {
      emit(ProfileState.error(message: error.toString()));
    }
  }
}
