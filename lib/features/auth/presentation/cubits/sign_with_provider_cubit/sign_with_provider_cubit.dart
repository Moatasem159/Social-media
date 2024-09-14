import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/usecases/set_user_data_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_in_usecase.dart';

// Part file containing state definitions for SignWithProviderCubit.
part 'sign_with_provider_state.dart';

/// The [SignWithProviderCubit] class is responsible for managing the
/// authentication flow with social media providers and setting the user's
/// data after authentication. It uses [SignInUsecase] for the sign-in process
/// and [SetUserDataUsecase] for setting user data.
///
/// This cubit handles two main actions:
/// - Sign in with a provider (Google, Facebook, etc.)
/// - Set user data after a successful sign-in
class SignWithProviderCubit extends Cubit<SignWithProviderStates> {
  /// Use case for handling the sign-in process.
  final SignInUsecase _signInUsecase;

  /// Use case for setting user data after authentication.
  final SetUserDataUsecase _setUserDataUsecase;

  /// Constructor to initialize the cubit with the required use cases.
  ///
  /// Takes [SetUserDataUsecase] for setting user data and [SignInUsecase]
  /// for handling sign-in.
  SignWithProviderCubit(this._setUserDataUsecase, this._signInUsecase)
      : super(const SignWithProviderInitialState());

  /// Signs in the user using a specified [SignInMethod] (such as Google or Facebook).
  ///
  /// This method triggers the following flow:
  /// 1. Emits [SignWithProviderLoadingState] to indicate that the sign-in process is in progress.
  /// 2. Calls the [_signInUsecase] with the provided [SignInMethod] to perform the sign-in.
  /// 3. Depending on the result of the sign-in attempt, it emits either:
  ///    - [SignWithProviderSuccessState] on successful sign-in, containing [UserCredential].
  ///    - [SignWithProviderErrorState] on failure, with an error message from [ApiError].
  ///
  /// Example:
  /// ```dart
  /// signWithProvider(SignInWithGoogle());
  /// ```
  ///
  /// Parameters:
  /// - [signInMethod]: An instance of [SignInMethod] representing the provider to use for sign-in.
  Future<void> signWithProvider(SignInMethod signInMethod) async {
    emit(const SignWithProviderLoadingState());

    // Perform the sign-in process using the given provider method.
    ApiResult<UserCredential> response = await _signInUsecase(signInMethod);

    // Handle the sign-in response.
    switch (response) {
      case ApiSuccess<UserCredential>():
        // Emit success state with the user's credentials.
        emit(SignWithProviderSuccessState(response.data));
      case ApiFailure<UserCredential>():
        // Emit error state with the failure reason.
        emit(SignWithProviderErrorState(error: response.errorHandler.apiError));
    }
  }

  /// Sets user data after a successful sign-in using the [SetUserDataUsecase].
  ///
  /// This method triggers the following flow:
  /// 1. Emits [SetUserDataLoadingState] to indicate that the user data setting process is in progress.
  /// 2. Calls [_setUserDataUsecase] with the [UserData] to store user-specific information.
  /// 3. Depending on the result, it emits either:
  ///    - [SetUserDataSuccessState] on success, indicating the data was set correctly.
  ///    - [SetUserDataErrorState] on failure, with an error message from [ApiError].
  ///
  /// Example:
  /// ```dart
  /// setUserData(userData);
  /// ```
  ///
  /// Parameters:
  /// - [user]: The [UserData] object containing user information to be set after authentication.
  Future<void> setUserData(UserData user) async {
    emit(const SetUserDataLoadingState());

    // Perform the user data setting process.
    ApiResult<void> response = await _setUserDataUsecase(user);

    // Handle the response for setting user data.
    switch (response) {
      case ApiSuccess<void>():
        // Emit success state if data was set successfully.
        emit(const SetUserDataSuccessState());
      case ApiFailure<void>():
        // Emit error state with the failure reason.
        emit(SetUserDataErrorState(error: response.errorHandler.apiError));
    }
  }
}