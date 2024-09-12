import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/usecases/set_user_data_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_with_facebook_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_with_twitter_usecase.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/complete_data_bottom_sheet.dart';

part 'sign_with_provider_state.dart';

class SignWithProviderCubit extends Cubit<SignWithProviderStates> {
  final SignWithGoogleUsecase _loginWithGoogleUsecaseUsecase;
  final SignWithFacebookUsecase _signWithFacebookUsecase;
  final SignWithTwitterUsecase _signWithTwitterUsecase;
  final SetUserDataUsecase _setUserDataUsecase;

  SignWithProviderCubit(
    this._loginWithGoogleUsecaseUsecase,
    this._setUserDataUsecase,
    this._signWithFacebookUsecase,
    this._signWithTwitterUsecase,
  ) : super(const SignWithProviderInitialState());

  signWithGoogle() async {
    emit(const SignWithProviderLoadingState());
    ApiResult<SignWithProviderResponseModel> response =
        await _loginWithGoogleUsecaseUsecase();
    switch (response) {
      case ApiSuccess<SignWithProviderResponseModel>():
        log(response.data.toString());
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<SignWithProviderResponseModel>():
        log(response.errorHandler.apiError.message);
        emit(SignWithProviderErrorState(response.errorHandler.apiError));
    }
  }

  signWithFacebook() async {
    //TODO: add remember me feature.
    emit(const SignWithProviderLoadingState());
    ApiResult<SignWithProviderResponseModel> response =
        await _signWithFacebookUsecase();
    switch (response) {
      case ApiSuccess<SignWithProviderResponseModel>():
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<SignWithProviderResponseModel>():
        log(response.errorHandler.apiError.message);
        emit(SignWithProviderErrorState(response.errorHandler.apiError));
    }
  }
  signWithTwitter() async {
    //TODO: add remember me feature.
    emit(const SignWithProviderLoadingState());
    ApiResult<SignWithProviderResponseModel> response =
    await _signWithTwitterUsecase();
    switch (response) {
      case ApiSuccess<SignWithProviderResponseModel>():
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<SignWithProviderResponseModel>():
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
        state.responseModel.firstLogin!) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        builder: (_) {
          return BlocProvider<SignWithProviderCubit>.value(
            value: context.read<SignWithProviderCubit>(),
            child: CompleteDateBottomSheet(
              uId: state.responseModel.userCredential!.user!.uid,
            ),
          );
        },
      );
    }
    if (state is SignWithProviderSuccessState &&
        !state.responseModel.firstLogin!) {
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