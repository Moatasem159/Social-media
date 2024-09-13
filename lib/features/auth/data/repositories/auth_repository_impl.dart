import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/data/sources/auth_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/auth_repository.dart';

/// Implementation of the [AuthRepository] interface.
///
/// This class provides concrete methods for signing in users, registering new users,
/// and setting user data. It handles network connectivity checks and error management.
///
/// It utilizes instances of [NetworkInfo] to check network connectivity and [AuthDataSource]
/// for interacting with data sources related to authentication and user data management.
///
/// Methods:
/// - [signIn]: Signs in a user using the specified [SignInMethod] and returns an [ApiResult]
///   with either a [UserCredential] or an error.
/// - [signup]: Registers a new user with email and password, then sets user data.
/// - [setUserData]: Sets user data using the provided [UserData] and returns an [ApiResult]
///   indicating success or failure.
///
/// Exceptions:
/// - Handles network-related exceptions if there is no internet connection.
/// - Handles errors that occur during the sign-in, registration, or user data setting processes.
class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  final AuthDataSource _authDataSource;

  /// Creates an instance of [AuthRepositoryImpl] with the specified dependencies.
  ///
  /// Parameters:
  /// - [_networkInfo]: An instance of [NetworkInfo] for checking network connectivity.
  /// - [_authDataSource]: An instance of [AuthDataSource] for interacting with authentication
  ///   and user data sources.
  const AuthRepositoryImpl(this._networkInfo, this._authDataSource);

  /// Signs in a user using the specified [SignInMethod].
  ///
  /// Checks network connectivity before attempting to sign in. If the network is available,
  /// it attempts to sign in using the provided [SignInMethod]. If successful, it returns an
  /// [ApiSuccess] containing the [UserCredential]. If an error occurs during sign-in, it
  /// returns an [ApiFailure] with the error details. If there is no network connection,
  /// it returns an [ApiFailure] indicating a network error.
  ///
  /// Parameters:
  /// - [signInMethod]: An instance of [SignInMethod] used for the sign-in operation.
  ///
  /// Returns:
  /// - [Future<ApiResult<UserCredential>>]: An [ApiResult] indicating success (with [UserCredential])
  ///   or failure.
  @override
  Future<ApiResult<UserCredential>> signIn(SignInMethod signInMethod) async {
    if (await _networkInfo.isConnected) {
      try {
        final UserCredential response = await _authDataSource.signIn(signInMethod);
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle(const NetworkException()));
    }
  }

  /// Registers a user using email and password, then sets user data.
  ///
  /// Checks network connectivity before attempting registration. If the network is available,
  /// it creates a new user with the provided credentials and user data. After registration,
  /// it updates the user data with the user's UID and returns an [ApiSuccess] with the
  /// [UserCredential]. If registration fails, it returns an [ApiFailure] with the error details.
  /// If there is no network connection, it returns an [ApiFailure] indicating a network error.
  ///
  /// Parameters:
  /// - [email]: The email address of the user to be registered.
  /// - [password]: The password for the user to be registered.
  /// - [userData]: An instance of [UserData] containing additional user information.
  ///
  /// Returns:
  /// - [Future<ApiResult<UserCredential>>]: An [ApiResult] indicating success (with [UserCredential])
  ///   or failure.
  @override
  Future<ApiResult<UserCredential>> signup(
      String email, String password, UserData userData) async {
    if (await _networkInfo.isConnected) {
      try {
        final UserCredential response = await _authDataSource
            .createUserWithEmailAndPassword(email, password, userData);
        userData = userData.copyWith(uId: response.user!.uid);
        await setUserData(userData);
        return ApiSuccess(data: response);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle(const NetworkException()));
    }
  }

  /// Sets user data using the provided [UserData].
  ///
  /// Checks network connectivity before attempting to set user data. If the network is available,
  /// it attempts to set the user data using the provided [UserData]. If successful, it returns
  /// an [ApiSuccess] with no data. If an error occurs, it returns an [ApiFailure] with the error details.
  /// If there is no network connection, it returns an [ApiFailure] indicating a network error.
  ///
  /// Parameters:
  /// - [user]: An instance of [UserData] containing the information to be set.
  ///
  /// Returns:
  /// - [Future<ApiResult<void>>]: An [ApiResult] indicating success or failure.
  @override
  Future<ApiResult<void>> setUserData(UserData user) async {
    if (await _networkInfo.isConnected) {
      try {
        await _authDataSource.setUserData(user);
        return const ApiSuccess<void>(data: null);
      } catch (error) {
        return ApiFailure(errorHandler: ErrorHandler.handle(error));
      }
    } else {
      return ApiFailure(errorHandler: ErrorHandler.handle(const NetworkException()));
    }
  }
}