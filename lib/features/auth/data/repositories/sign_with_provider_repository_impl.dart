import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/sign_with_providers_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';

/// Implementation of the [SignInRepository] interface.
///
/// This class provides concrete methods for signing in users and setting user data,
/// while handling network connectivity checks and error management.
///
/// It utilizes instances of [NetworkInfo] to check network connectivity
/// and [SignInDataSource] for interacting with data sources related to sign-in
/// and user data management.
///
/// Methods:
/// - [signIn]: Signs in a user using the specified [SignInMethod] and returns
///   an [ApiResult] with either a [UserCredential] or an error.
/// - [setUserData]: Sets user data using the provided [UserData] and returns
///   an [ApiResult] with either success or an error.
///
/// Exceptions:
/// - Handles network-related exceptions if there is no internet connection.
/// - Handles errors that occur during the sign-in or user data setting processes.
class SignInRepositoryImpl implements SignInRepository {
  final NetworkInfo _networkInfo;
  final SignInDataSource _signWithProviderDataSource;

  /// Constructor for [SignInRepositoryImpl].
  ///
  /// Parameters:
  /// - [_networkInfo]: An instance of [NetworkInfo] for checking network connectivity.
  /// - [_signWithProviderDataSource]: An instance of [SignInDataSource] for interacting
  ///   with data sources related to sign-in and user data.
  const SignInRepositoryImpl(this._networkInfo, this._signWithProviderDataSource);

  /// Signs in a user using the specified [SignInMethod].
  ///
  /// Checks network connectivity before attempting to sign in. If the network is available,
  /// it tries to sign in the user using the provided [SignInMethod]. If the sign-in is
  /// successful, it returns an [ApiSuccess] containing the [UserCredential]. If an error
  /// occurs during sign-in, it returns an [ApiFailure] with the appropriate error details.
  /// If there is no network connection, it returns an [ApiFailure] indicating a network
  /// error.
  ///
  /// Parameters:
  /// - [signInMethod]: An instance of [SignInMethod] used to perform the sign-in operation.
  ///
  /// Returns:
  /// - [ApiResult<UserCredential>]: An [ApiSuccess] with the [UserCredential] if the sign-in
  ///   is successful, or an [ApiFailure] if an error occurs or if there is no network connection.
  @override
  Future<ApiResult<UserCredential>> signIn(SignInMethod signInMethod) async {
    // Check if network is available before proceeding with sign-in.
    if (await _networkInfo.isConnected) {
      try {
        // Attempt to sign in the user using the provided sign-in method.
        final UserCredential response = await _signWithProviderDataSource.signIn(signInMethod);
        return ApiSuccess(data: response);
      } catch (error) {
        // Handle any errors that occur during the sign-in process.
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      // Handle the case where there is no network connection.
      return ApiFailure(errorHandler: ErrorHandler.handle(const NetworkException()));
    }
  }


  /// Sets user data using the provided [UserData].
  ///
  /// Checks network connectivity before attempting to set user data. If the network is available,
  /// it tries to set the user data using the provided [UserData]. If the operation is successful,
  /// it returns an [ApiSuccess] with no data. If an error occurs during the process, it returns
  /// an [ApiFailure] with the appropriate error details. If there is no network connection,
  /// it returns an [ApiFailure] indicating a network error.
  ///
  /// Parameters:
  /// - [user]: An instance of [UserData] that contains the user information to be set.
  ///
  /// Returns:
  /// - [ApiResult<void>]: An [ApiSuccess] with no data if the user data is set successfully,
  ///   or an [ApiFailure] if an error occurs or if there is no network connection.
  @override
  Future<ApiResult<void>> setUserData(UserData user) async {
    // Check if network is available before proceeding with setting user data.
    if (await _networkInfo.isConnected) {
      try {
        // Attempt to set the user data using the provided user information.
        await _signWithProviderDataSource.setUserData(user);
        return const ApiSuccess<void>(data: null);
      } catch (error) {
        // Handle any errors that occur during the process of setting user data.
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      // Handle the case where there is no network connection.
      return ApiFailure(errorHandler: ErrorHandler.handle(const NetworkException()));
    }
  }
}