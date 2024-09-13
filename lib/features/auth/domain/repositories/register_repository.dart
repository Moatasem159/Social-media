import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';

/// Abstract class defining the contract for user registration repositories.
///
/// This class outlines the method required for user registration, including the handling
/// of the result and any associated errors.
///
/// The method returns an [ApiResult] which contains either a successful result or an error.
abstract class RegisterRepository {
  /// Registers a new user with email and password, and provides additional user data.
  ///
  /// Parameters:
  /// - [email]: The email address for the new user.
  /// - [password]: The password for the new user.
  /// - [userData]: An instance of [UserData] containing additional user information.
  ///
  /// Returns:
  /// - [Future<ApiResult<UserCredential>>]: A future that completes with an [ApiResult] containing
  ///   either the credentials of the newly created user or an error if the registration fails.
  Future<ApiResult<UserCredential>> signup(String email, String password, UserData userData);
}