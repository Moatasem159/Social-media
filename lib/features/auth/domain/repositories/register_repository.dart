import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterRepository {
  Future<ApiResult<AuthResponse>> signup({required UserCredintial user});
}