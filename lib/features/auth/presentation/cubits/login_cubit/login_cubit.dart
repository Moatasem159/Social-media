import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/features/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginWithEmailAndPasswordUsecase _loginWithEmailAndPasswordUsecase;
  final LoginWithGoogleUsecaseUsecase _loginWithGoogleUsecaseUsecase;

  LoginCubit(this._loginWithEmailAndPasswordUsecase,
      this._loginWithGoogleUsecaseUsecase)
      : super(const LoginInitialState());

  emitLoginWithEmailAndPasswordStates(
      {required String email,
      required String password,
      bool rememberMe = false}) async {
    ///TODO: add remember me feature.
    emit(const LoginLoadingState());
    ApiResult<AuthResponse> response =
        await _loginWithEmailAndPasswordUsecase(email, password);
    switch (response) {
      case ApiSuccess<AuthResponse>():
        emit(const LoginSuccessState());
      case ApiFailure<AuthResponse>():
        emit(LoginErrorState(response.errorHandler.apiError));
    }
  }

  emitLoginWithGoogleStates({bool rememberMe = false}) async {
    ///TODO: add remember me feature.
    emit(const LoginLoadingState());
    ApiResult<AuthResponse> response = await _loginWithGoogleUsecaseUsecase();
    switch (response) {
      case ApiSuccess<AuthResponse>():
        log(response.data.toString());
        emit(const LoginSuccessState());
      case ApiFailure<AuthResponse>():
        emit(LoginErrorState(response.errorHandler.apiError));
    }
  }

  listener(context, state) {
    if (state is LoginSuccessState) {
      //TODO: action after login done.
    }
    if (state is LoginErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error.message),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
      );
    }
  }
}