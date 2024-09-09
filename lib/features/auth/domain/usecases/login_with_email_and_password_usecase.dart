import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginWithEmailAndPasswordUsecase {
  final LoginRepository _loginRepository;

  const LoginWithEmailAndPasswordUsecase(this._loginRepository);

  Future<ApiResult<AuthResponse>> call(String email, String password) =>
      _loginRepository.signIn(email, password);
}