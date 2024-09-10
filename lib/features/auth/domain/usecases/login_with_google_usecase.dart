import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
class LoginWithGoogleUsecaseUsecase {
  final LoginRepository _loginRepository;

  const LoginWithGoogleUsecaseUsecase(this._loginRepository);

  Future<ApiResult<GoogleSignInResponseModel>> call() => _loginRepository.signInWithGoogle();
}