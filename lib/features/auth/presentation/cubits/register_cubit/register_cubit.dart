import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterWithEmailAndPasswordUsecase _emailAndPasswordUsecase;

  RegisterCubit(this._emailAndPasswordUsecase)
      : super(const RegisterInitialState());

  emitRegisterStates({required UserCredintial user}) async {
    emit(const RegisterLoadingState());
    ApiResult<AuthResponse> response =
        await _emailAndPasswordUsecase(user: user);
    switch (response) {
      case ApiSuccess<AuthResponse>():
        emit(RegisterSuccessState(response.data));
      case ApiFailure<AuthResponse>():
        emit(RegisterErrorState(error: response.errorHandler.apiError));
    }
  }

  listener(context, state) {
    if (state is RegisterErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.error.message),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      ));
    }
  }
}