import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/sources/register_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo _networkInfo;
  final RegisterDataSource _registerDataSource;
  RegisterRepositoryImpl(this._registerDataSource, this._networkInfo);
  @override
  Future<ApiResult<AuthResponse>> signup({required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthResponse response =await _registerDataSource.createUserWithEmailAndPassword(email,password);
        return ApiSuccess(data: response);
      }  catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }
}