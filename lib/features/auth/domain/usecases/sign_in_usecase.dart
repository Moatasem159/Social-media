import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';
class SignInUsecase {
  final SignInRepository _signInRepository;
  const SignInUsecase(this._signInRepository);
  Future<ApiResult<UserCredential>> call(SignInMethod signInMethod) => _signInRepository.signIn(signInMethod);
}