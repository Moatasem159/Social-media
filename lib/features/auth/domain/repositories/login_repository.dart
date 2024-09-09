import 'package:social_media/core/api/api_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  Future<ApiResult<AuthResponse>> signIn(String email, String password);
  Future<ApiResult<AuthResponse>> signInWithGoogle();
}