import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/sources/login_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo _networkInfo;
  final LoginDataSource _loginDataSource;
  const LoginRepositoryImpl(this._loginDataSource, this._networkInfo);
  @override
  Future<ApiResult<AuthResponse>> signIn(String email, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthResponse response = await _loginDataSource.signIn(email, password);
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }

  @override
  Future<ApiResult<GoogleSignInResponseModel>> signInWithGoogle() async{
    if (await _networkInfo.isConnected) {
      try {
        final GoogleSignInResponseModel response = await _loginDataSource.googleSignIn();
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }
}