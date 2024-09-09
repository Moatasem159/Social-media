import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginWithGoogleUsecaseUsecase {
  final LoginRepository _loginRepository;

  const LoginWithGoogleUsecaseUsecase(this._loginRepository);

  Future<ApiResult<AuthResponse>> call() => _loginRepository.signInWithGoogle();
}