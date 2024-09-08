import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/register_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo _networkInfo;
  final RegisterDataSource _registerDataSource;

  RegisterRepositoryImpl(this._registerDataSource, this._networkInfo);

  @override
  Future<ApiResult<AuthResponse>> signup({required UserCredintial user}) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthResponse response = await _registerDataSource.createUserWithEmailAndPassword(user.email, user.password);
        _setUserData(user.copyWith(uId: response.user!.id));
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }

  Future<void> _setUserData(UserCredintial user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
}