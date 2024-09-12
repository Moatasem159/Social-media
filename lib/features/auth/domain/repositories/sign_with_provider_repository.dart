import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
abstract class SignWithProviderRepository{
  Future<ApiResult<void>> setUserData(UserData user);
  Future<ApiResult<SignWithGoogleResponseModel>> signInWithGoogle();
  Future<ApiResult<SignWithFacebookResponseModel>> signInWithFaceBook();
}