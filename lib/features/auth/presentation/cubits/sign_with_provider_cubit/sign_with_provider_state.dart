part of 'sign_with_provider_cubit.dart';
/// The base class for all states emitted by the [SignWithProviderCubit].
///
/// This class is `sealed` to ensure all subclasses are defined within the same file.
sealed class SignWithProviderStates {
  const SignWithProviderStates();
}
/// The initial state of the [SignWithProviderCubit] before any action is taken.
///
/// This state is emitted when the cubit is first created.
final class SignWithProviderInitialState extends SignWithProviderStates {
  const SignWithProviderInitialState();
}
/// State emitted when the process of setting user data is in progress.
///
/// This state indicates that the system is currently saving user data after authentication.
final class SetUserDataLoadingState extends SignWithProviderStates {
  const SetUserDataLoadingState();
}
/// State emitted when user data is successfully set.
///
/// This state is triggered when the user data is stored in the backend successfully.
final class SetUserDataSuccessState extends SignWithProviderStates {
  const SetUserDataSuccessState();
}
/// State emitted when there is an error setting user data.
///
/// This state includes an [ApiError] that describes the reason for the failure.
final class SetUserDataErrorState extends SignWithProviderStates {
  final ApiError error;

  /// Constructor for the error state when setting user data.
  ///
  /// - [error]: The error message describing why the user data setting failed.
  const SetUserDataErrorState({required this.error});
}
/// State emitted when the sign-in process with a provider is in progress.
///
/// This state indicates that the authentication flow is currently happening.
final class SignWithProviderLoadingState extends SignWithProviderStates {
  const SignWithProviderLoadingState();
}
/// State emitted when signing in with a provider is successful.
///
/// This state contains the [UserCredential] returned after a successful authentication.
final class SignWithProviderSuccessState extends SignWithProviderStates {
  final UserCredential userCredential;

  /// Constructor for the success state when signing in with a provider.
  ///
  /// - [userCredential]: The user credentials obtained after successful sign-in.
  const SignWithProviderSuccessState(this.userCredential);
}
/// State emitted when there is an error during sign-in with a provider.
///
/// This state includes an [ApiError] that provides details on the error encountered.
final class SignWithProviderErrorState extends SignWithProviderStates {
  final ApiError error;

  /// Constructor for the error state during sign-in.
  ///
  /// - [error]: The error message explaining why the sign-in failed.
  const SignWithProviderErrorState({required this.error});
}