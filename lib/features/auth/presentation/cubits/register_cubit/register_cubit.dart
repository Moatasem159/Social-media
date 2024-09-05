import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterWithEmailAndPasswordUsecase _emailAndPasswordUsecase;

  RegisterCubit(this._emailAndPasswordUsecase) : super(RegisterInitialState());

  emitRegisterStates() async {
    emit(RegisterLoadingState());
    ApiResult<AuthResponse> response =
        await _emailAndPasswordUsecase(email: "", password: "");

    emit(
      switch (response) {
        ApiSuccess<AuthResponse>() => RegisterSuccessState(),
        ApiFailure<AuthResponse>() => RegisterErrorState(),
      },
    );
  }
}