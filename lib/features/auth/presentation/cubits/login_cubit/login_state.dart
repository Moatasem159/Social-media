part of 'login_cubit.dart';

sealed class LoginStates {
  const LoginStates();
}

final class LoginInitialState extends LoginStates {
  const LoginInitialState();
}
final class LoginLoadingState extends LoginStates {
  const LoginLoadingState();
}
final class LoginSuccessState extends LoginStates {
  const LoginSuccessState();
}
final class LoginErrorState extends LoginStates {
  final ApiError error;
  const LoginErrorState(this.error);
}