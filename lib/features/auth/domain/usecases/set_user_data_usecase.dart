import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';

/// Use case for setting user data.
///
/// This class provides functionality to set user data using the provided user information.
///
/// It uses an instance of [SignInRepository] to perform the operation of setting user data.
///
/// Methods:
/// - [call]: Sets user data in the repository, and returns an [ApiResult] indicating success or failure.
class SetUserDataUsecase {
  final SignInRepository _signWithProviderRepository;

  /// Creates an instance of [SetUserDataUsecase] with the specified [SignInRepository].
  ///
  /// Parameters:
  /// - [_signWithProviderRepository]: An instance of [SignInRepository] used for setting
  ///   the user data.
  const SetUserDataUsecase(this._signWithProviderRepository);

  /// Sets user data using the provided [UserData].
  ///
  /// Calls the [setUserData] method of the [SignInRepository] to perform the operation.
  /// It returns an [ApiResult] indicating success or failure of setting the user data.
  ///
  /// Parameters:
  /// - [user]: An instance of [UserData] containing the user information to be set.
  ///
  /// Returns:
  /// - [Future<ApiResult<void>>]: A future that completes with an [ApiResult] indicating
  ///   success (with no data) or failure.
  Future<ApiResult<void>> call(UserData user) => _signWithProviderRepository.setUserData(user);
}