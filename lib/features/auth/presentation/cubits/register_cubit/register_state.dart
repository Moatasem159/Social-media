part of 'register_cubit.dart';

sealed class RegisterStates {
  const RegisterStates();
}

final class RegisterInitialState extends RegisterStates {
  const RegisterInitialState();
}
final class RegisterLoadingState extends RegisterStates {
  const RegisterLoadingState();
}
final class RegisterSuccessState extends RegisterStates {
  const RegisterSuccessState();
}
final class RegisterErrorState extends RegisterStates {
  final ApiError error;
  const RegisterErrorState({required this.error});
}