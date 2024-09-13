import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';

/// Use case for registering a user with email and password.
///
/// This class provides functionality to register a new user using their email
/// and password, and sets the user data in the repository.
///
/// It uses an instance of [RegisterRepository] to perform the registration process.
///
/// Methods:
/// - [call]: Registers a user with the given email, password, and user data, and
///   returns an [ApiResult] containing either the [UserCredential] or an error.
class RegisterWithEmailAndPasswordUsecase {
  final RegisterRepository _registerRepository;

  /// Creates an instance of [RegisterWithEmailAndPasswordUsecase] with the specified
  /// [RegisterRepository].
  ///
  /// Parameters:
  /// - [_registerRepository]: An instance of [RegisterRepository] used for performing
  ///   the registration operation.
  RegisterWithEmailAndPasswordUsecase(this._registerRepository);

  /// Registers a user with the given email and password, and sets user data.
  ///
  /// Calls the [signup] method of the [RegisterRepository] to perform the registration.
  /// It returns an [ApiResult] containing the [UserCredential] if registration is
  /// successful, or an error if registration fails.
  ///
  /// Parameters:
  /// - [email]: The email address of the user.
  /// - [password]: The password for the user.
  /// - [userData]: An instance of [UserData] containing additional user information.
  ///
  /// Returns:
  /// - [Future<ApiResult<UserCredential>>]: A future that completes with an [ApiResult]
  ///   containing either the [UserCredential] or an error.
  Future<ApiResult<UserCredential>> call(String email, String password, UserData userData) =>
      _registerRepository.signup(email, password, userData);
}