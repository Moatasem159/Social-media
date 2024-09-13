import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/domain/repositories/auth_repository.dart';

/// Use case for signing in a user.
///
/// This class provides functionality to sign in a user using the specified sign-in method.
///
/// It uses an instance of [AuthRepository] to perform the sign-in operation.
///
/// Methods:
/// - [call]: Signs in the user using the provided [SignInMethod] and returns an [ApiResult]
///   with either the [UserCredential] or an error.
class SignInUsecase {
  final AuthRepository _authRepository;

  /// Creates an instance of [SignInUsecase] with the specified [AuthRepository].
  ///
  /// Parameters:
  /// - [_signInRepository]: An instance of [AuthRepository] used for performing
  ///   the sign-in operation.
  const SignInUsecase(this._authRepository);

  /// Signs in a user using the specified [SignInMethod].
  ///
  /// Calls the [signIn] method of the [AuthRepository] to perform the sign-in operation.
  /// Returns an [ApiResult] indicating success (with [UserCredential]) or failure.
  ///
  /// Parameters:
  /// - [signInMethod]: An instance of [SignInMethod] used to perform the sign-in operation.
  ///
  /// Returns:
  /// - [Future<ApiResult<UserCredential>>]: A future that completes with an [ApiResult]
  ///   indicating success (with [UserCredential]) or failure.
  Future<ApiResult<UserCredential>> call(SignInMethod signInMethod) =>
      _authRepository.signIn(signInMethod);
}