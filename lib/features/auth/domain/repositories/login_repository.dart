import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  Future<ApiResult<AuthResponse>> signIn(String email, String password);
  Future<ApiResult<GoogleSignInResponseModel>> signInWithGoogle();
}