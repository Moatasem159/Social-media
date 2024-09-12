import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
abstract class LoginRepository {
  Future<ApiResult<UserCredential>> signIn(String email, String password);
}