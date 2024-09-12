import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';
class SignWithTwitterUsecase {
  final SignWithProviderRepository _signWithProviderRepository;
  const SignWithTwitterUsecase(this._signWithProviderRepository);
  Future<ApiResult<SignWithProviderResponseModel>> call() => _signWithProviderRepository.signInWithTwitter();
}