import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
class LoginWithEmailAndPasswordUsecase {
  final LoginRepository _loginRepository;
  const LoginWithEmailAndPasswordUsecase(this._loginRepository);
  Future<ApiResult<UserCredential>> call(String email, String password) =>
      _loginRepository.signIn(email, password);
}