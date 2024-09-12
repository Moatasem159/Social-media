import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
abstract class RegisterRepository {
  Future<ApiResult<UserCredential>> signup(String email, String password,UserData userData);
}