part of 'reset_password_cubit.dart';
sealed class ResetPasswordStates {
  const ResetPasswordStates();
}
final class ResetPasswordInitialState extends ResetPasswordStates {
  const ResetPasswordInitialState();
}
final class ResetPasswordLoadingState extends ResetPasswordStates {
  const ResetPasswordLoadingState();
}
final class ResetPasswordSuccessState extends ResetPasswordStates {
  const ResetPasswordSuccessState();
}
final class ResetPasswordErrorState extends ResetPasswordStates {
  final ApiError error;
  const ResetPasswordErrorState({required this.error});
}