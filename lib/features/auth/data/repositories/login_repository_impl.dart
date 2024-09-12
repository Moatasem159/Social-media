import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/sources/login_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo _networkInfo;
  final LoginDataSource _loginDataSource;
  const LoginRepositoryImpl(this._loginDataSource, this._networkInfo);
  @override
  Future<ApiResult<UserCredential>> signIn(String email, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final UserCredential response = await _loginDataSource.signIn(email, password);
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }

}