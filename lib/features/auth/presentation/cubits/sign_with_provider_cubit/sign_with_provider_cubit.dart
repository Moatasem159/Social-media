import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/usecases/set_user_data_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/complete_data_bottom_sheet.dart';
part 'sign_with_provider_state.dart';
class SignWithProviderCubit extends Cubit<SignWithProviderStates> {
  final SignInUsecase _signInUsecase;
  final SetUserDataUsecase _setUserDataUsecase;
  SignWithProviderCubit(this._setUserDataUsecase,this._signInUsecase) : super(const SignWithProviderInitialState());
  signWithGoogle() async {
    emit(const SignWithProviderLoadingState());
    ApiResult<UserCredential> response = await _signInUsecase(SignInWithGoogle());
    switch (response) {
      case ApiSuccess<UserCredential>():
        log(response.data.toString());
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<UserCredential>():
        log(response.errorHandler.apiError.message);
        emit(SignWithProviderErrorState(response.errorHandler.apiError));
    }
  }

  signWithFacebook() async {
    //TODO: add remember me feature.
    emit(const SignWithProviderLoadingState());
    ApiResult<UserCredential> response = await _signInUsecase(SignInWithFacebook());
    switch (response) {
      case ApiSuccess<UserCredential>():
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<UserCredential>():
        log(response.errorHandler.apiError.message);
        emit(SignWithProviderErrorState(response.errorHandler.apiError));
    }
  }

  signWithTwitter() async {
    //TODO: add remember me feature.
    emit(const SignWithProviderLoadingState());
    ApiResult<UserCredential> response = await _signInUsecase(SignInWithTwitter());
    switch (response) {
      case ApiSuccess<UserCredential>():
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<UserCredential>():
        log(response.errorHandler.apiError.message);
        emit(SignWithProviderErrorState(response.errorHandler.apiError));
    }
  }

  setUserData(UserData user) async {
    emit(const SetUserDataLoadingState());
    ApiResult<void> response = await _setUserDataUsecase(user);
    switch (response) {
      case ApiSuccess<void>():
        emit(const SetUserDataSuccessState());
      case ApiFailure<void>():
        emit(SetUserDataErrorState(response.errorHandler.apiError));
    }
  }

  mainListener(BuildContext context, SignWithProviderStates state) {
    if (state is SignWithProviderSuccessState &&
        state.userCredential.additionalUserInfo!.isNewUser) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        builder: (_) {
          return BlocProvider<SignWithProviderCubit>.value(
            value: context.read<SignWithProviderCubit>(),
            child: CompleteDateBottomSheet(uId: state.userCredential.user!.uid),
          );
        },
      );
    }
    if (state is SignWithProviderSuccessState &&
        !state.userCredential.additionalUserInfo!.isNewUser) {
      //TODO:navigate to home;
    }
    if (state is SignWithProviderErrorState) {
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