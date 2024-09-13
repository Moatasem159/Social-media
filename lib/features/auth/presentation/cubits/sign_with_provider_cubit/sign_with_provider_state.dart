part of 'sign_with_provider_cubit.dart';
sealed class SignWithProviderStates {
  const SignWithProviderStates();
}
final class SignWithProviderInitialState extends SignWithProviderStates {
  const SignWithProviderInitialState();
}
final class SetUserDataLoadingState extends SignWithProviderStates {
  const SetUserDataLoadingState();
}
final class SetUserDataSuccessState extends SignWithProviderStates {
  const SetUserDataSuccessState();
}
final class SetUserDataErrorState extends SignWithProviderStates {
  final ApiError error;
  const SetUserDataErrorState(this.error);
}
final class SignWithProviderLoadingState extends SignWithProviderStates {
  const SignWithProviderLoadingState();
}
final class SignWithProviderSuccessState extends SignWithProviderStates {
  final UserCredential userCredential;
  const SignWithProviderSuccessState(this.userCredential);
}
final class SignWithProviderErrorState extends SignWithProviderStates {
  final ApiError error;
  const SignWithProviderErrorState(this.error);
}