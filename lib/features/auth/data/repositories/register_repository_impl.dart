import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/register_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';

/// Implementation of [RegisterRepository] for user registration.
///
/// This class handles the process of user registration, including network connectivity checks
/// and error handling. It delegates the actual user creation to a data source and processes
/// the result using [ApiResult] to handle success and failure scenarios.
class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo _networkInfo;
  final RegisterDataSource _registerDataSource;

  /// Creates an instance of [RegisterRepositoryImpl] with the specified [RegisterDataSource]
  /// and [NetworkInfo].
  ///
  /// Parameters:
  /// - [_registerDataSource]: An instance of [RegisterDataSource] used for user registration.
  /// - [_networkInfo]: An instance of [NetworkInfo] used to check network connectivity.
  const RegisterRepositoryImpl(this._registerDataSource, this._networkInfo);

  @override
  Future<ApiResult<UserCredential>> signup(String email, String password, UserData userData) async {
    // Check network connectivity before attempting registration.
    if (await _networkInfo.isConnected) {
      try {
        // Attempt to create a new user with the provided credentials and user data.
        final UserCredential response = await _registerDataSource.createUserWithEmailAndPassword(email, password, userData);
        // Return success result with user credentials if registration is successful.
        return ApiSuccess(data: response);
      } catch (error) {
        // Return failure result with appropriate error message if an exception occurs.
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      // Return failure result with network error if there is no internet connection.
      return ApiFailure(errorHandler: ErrorHandler.handle(const NetworkException()));
    }
  }
}