import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
class RegisterWithEmailAndPasswordUsecase {
  final RegisterRepository _registerRepository;
  RegisterWithEmailAndPasswordUsecase(this._registerRepository);
  Future<ApiResult<UserCredential>> call(String email, String password,UserData userData) =>
      _registerRepository.signup(email, password,userData);
}