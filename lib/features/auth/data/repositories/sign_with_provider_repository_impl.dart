import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/sign_with_providers_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';

class SignWithProviderRepositoryImpl implements SignWithProviderRepository {
  final NetworkInfo _networkInfo;
  final SignWithProviderDataSource _signWithProviderDataSource;

  const SignWithProviderRepositoryImpl(
      this._networkInfo, this._signWithProviderDataSource);

  @override
  Future<ApiResult<SignWithProviderResponseModel>> signInWithGoogle() async {
    if (await _networkInfo.isConnected) {
      try {
        final SignWithProviderResponseModel response =
            await _signWithProviderDataSource.googleSignIn();
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
        return  const ApiSuccess<void>(data:null);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle("connection error"));
    }
  }
}