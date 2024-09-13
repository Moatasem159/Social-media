import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
/// Abstract class defining the contract for user authentication and user data management.
///
/// This class outlines the methods required to manage user authentication and user data through
/// a repository pattern. It provides the interface for signing up users, signing in, setting user data,
/// and resetting passwords.
///
/// Methods:
/// - [signup]: Registers a new user with email and password, and provides additional user data.
/// - [setUserData]: Sets user data in the repository.
/// - [signIn]: Signs in a user using a specified sign-in method.
/// - [resetPassword]: Sends a password reset email to the specified email address.
///
/// Exceptions:
/// - Handles errors that occur during user registration, sign-in, user data setting, or password resetting.
abstract class AuthRepository {
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
  /// Sets user data in the repository.
  ///
  /// Parameters:
  /// - [user]: An instance of [UserData] containing the user information to be saved.
  ///
  /// Returns:
  /// - [Future<ApiResult<void>>]: A future that completes with an [ApiResult] indicating the success or failure of the operation.
  Future<ApiResult<void>> setUserData(UserData user);
  /// Sends a password reset email to the specified email address.
  ///
  /// Parameters:
  /// - [email]: The email address to which the password reset email should be sent.
  ///
  /// Returns:
  /// - [Future<ApiResult<void>>]: A future that completes with an [ApiResult] indicating the success or failure of the operation.
  Future<ApiResult<void>> resetPassword(String email);
  /// Signs in a user using a specified sign-in method.
  ///
  /// Parameters:
  /// - [signInMethod]: An instance of [SignInMethod] specifying the sign-in strategy to be used.
  ///
  /// Returns:
  /// - [Future<ApiResult<UserCredential>>]: A future that completes with an [ApiResult] containing
  ///   the credentials of the signed-in user or an error.
  Future<ApiResult<UserCredential>> signIn(SignInMethod signInMethod);
}