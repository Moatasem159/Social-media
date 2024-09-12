import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/register_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo _networkInfo;
  final RegisterDataSource _registerDataSource;
  const RegisterRepositoryImpl(this._registerDataSource, this._networkInfo);
  @override
  Future<ApiResult<UserCredential>> signup(String email, String password,UserData userData) async {
    if (await _networkInfo.isConnected) {
      try {
        final UserCredential response = await _registerDataSource.createUserWithEmailAndPassword(email,password,userData);
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }
}