import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class RegisterWithEmailAndPasswordUsecase {
  final RegisterRepository _registerRepository;
  RegisterWithEmailAndPasswordUsecase(this._registerRepository);
  Future<ApiResult<AuthResponse>> call({required UserCredintial user}) =>
      _registerRepository.signup(user: user);
}