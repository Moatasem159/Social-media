import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/widgets/snack_bar.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/domain/usecases/sign_in_usecase.dart';
part 'login_state.dart';
class LoginCubit extends Cubit<LoginStates> {
  final SignInUsecase _signInUsecase;
  LoginCubit(this._signInUsecase) : super(const LoginInitialState());
  emitLoginWithEmailAndPasswordStates(
      {required String email,
      required String password,
      bool rememberMe = false}) async {
    ///TODO: add remember me feature.
    emit(const LoginLoadingState());
    ApiResult<UserCredential> response = await _signInUsecase(
        SignInWithEmailAndPassword(email: email, password: password));
    switch (response) {
      case ApiSuccess<UserCredential>():
        emit(const LoginSuccessState());
      case ApiFailure<UserCredential>():
        emit(LoginErrorState(response.errorHandler.apiError));
    }
  }

  listener(context, state) {
    if (state is LoginSuccessState) {
      //TODO: action after login done.
    }
    if (state is LoginErrorState) {
      context.showSnackBar(snackBar(state.error.message.getErrorMessage(context)));
    }
  }
}