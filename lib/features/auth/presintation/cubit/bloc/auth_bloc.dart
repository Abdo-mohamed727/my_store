import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/features/auth/data/models/login_request_body.dart';
import 'package:my_store/features/auth/data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo) : super(const AuthState.initial()) {
    on<AuthEvent>(_login);
  }

  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FutureOr<void> _login(AuthEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await authRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    await result.when(
      success: (loginData) async {
        await SharedPref().setString(
          ShareKeys.accesstoken,
          loginData.data.login.accessToken,
        );
        final user = await authRepo.userRole(
          loginData.data.login.accessToken,
        );
        await SharedPref().setInt(ShareKeys.userId, user.userId ?? 0);

        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (failure) {
        emit(const AuthState.error());
      },
    );
  }
}
