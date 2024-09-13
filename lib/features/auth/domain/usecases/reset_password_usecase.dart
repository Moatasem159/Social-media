import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/domain/repositories/auth_repository.dart';
/// Use case for handling password reset requests.
///
/// This class encapsulates the logic for requesting a password reset. It interacts with the
/// [AuthRepository] to perform the password reset operation.
///
/// Methods:
/// - [call]: Initiates a password reset process using the provided email address.
///
/// Dependencies:
/// - [_authRepository]: An instance of [AuthRepository] used to perform the password reset operation.
///
/// Parameters:
/// - [email]: The email address associated with the user account for which the password reset
///   is requested.
///
/// Returns:
/// - [Future<ApiResult<void>>]: An [ApiResult] indicating the success or failure of the password
///   reset operation.
class ResetPasswordUsecase {
  final AuthRepository _authRepository;
  /// Creates an instance of [ResetPasswordUsecase] with the specified [AuthRepository].
  ///
  /// Parameters:
  /// - [_authRepository]: An instance of [AuthRepository] used to perform authentication-related
  ///   operations, including password resets.
  const ResetPasswordUsecase(this._authRepository);
  /// Initiates a password reset process using the provided email address.
  ///
  /// This method calls the [resetPassword] method on the [AuthRepository] instance. It returns
  /// an [ApiResult] indicating whether the operation was successful or if an error occurred.
  ///
  /// Parameters:
  /// - [email]: The email address associated with the user account for which the password reset
  ///   is requested.
  ///
  /// Returns:
  /// - [Future<ApiResult<void>>]: An [ApiResult] indicating the success or failure of the password
  ///   reset operation.
  Future<ApiResult<void>> call(String email) => _authRepository.resetPassword(email);
}