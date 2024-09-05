import 'package:social_media/core/api/api_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterRepository {
  Future<ApiResult<AuthResponse>> signup({required String email, required String password});
}