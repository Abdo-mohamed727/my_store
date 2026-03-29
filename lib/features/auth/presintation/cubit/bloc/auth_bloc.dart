import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/core/api/dio_factory.dart';
import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/features/auth/data/models/login_request_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:my_store/features/auth/data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo) : super(const AuthState.initial()) {
    on<AuthEvent>(_login);
    on<SignUpEvent>(_signUp);
  }

  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
        final token = loginData.data.login.accessToken;
        await SharedPref().setString(
          ShareKeys.accesstoken,
          token,
        );
        DioFactory.updateAuthToken(token);
        final user = await authRepo.userRole(token);
        await SharedPref().setInt(ShareKeys.userId, user.userId ?? 0);

        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (failure) {
        emit(AuthState.error(message: failure));
      },
    );
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await authRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        avatar: event.imgUrl,
      ),
    );
    result.when(
      success: (signUpData) {
        add(AuthEvent.login());
      },
      failure: (failure) {
        emit(AuthState.error(message: failure));
      },
    );
  }
}
