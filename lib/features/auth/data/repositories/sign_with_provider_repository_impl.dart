import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/sign_with_providers_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';
class SignInRepositoryImpl implements SignInRepository {
  final NetworkInfo _networkInfo;
  final SignInDataSource _signWithProviderDataSource;
  const SignInRepositoryImpl(this._networkInfo,this._signWithProviderDataSource);
  @override
  Future<ApiResult<UserCredential>> signIn(SignInMethod signInMethod) async {
    if (await _networkInfo.isConnected) {
      try {
        final UserCredential response = await _signWithProviderDataSource.signIn(signInMethod);
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }

  @override
  Future<ApiResult<void>> setUserData(UserData user) async {
    if (await _networkInfo.isConnected) {
      try {
        await _signWithProviderDataSource.setUserData(user);
        return const ApiSuccess<void>(data: null);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }
}