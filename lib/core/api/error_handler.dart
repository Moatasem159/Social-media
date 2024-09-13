import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/core/extensions/context_extensions.dart';

/// Handles exceptions and provides user-friendly API error messages.
///
/// This class is responsible for converting various types of errors into user-friendly
/// error messages by mapping them to an [ApiError] instance.
///
/// The [ErrorHandler] class specifically handles errors related to Firebase authentication
/// and network connectivity.
class ErrorHandler implements Exception {
  /// The [ApiError] instance associated with the error.
  final ApiError apiError;

  /// Creates an [ErrorHandler] instance by processing the given [error].
  ///
  /// The constructor uses the private method [_mapErrorToApiError] to determine the
  /// appropriate error message based on the type of error.
  ///
  /// [error]: The error to be handled, which can be of various types, such as [FirebaseAuthException]
  /// or [NetworkException].
  ErrorHandler.handle(dynamic error) : apiError = _mapErrorToApiError(error);

  /// Maps a given error to an [ApiError] instance.
  ///
  /// This static method identifies the type of error and returns an appropriate [ApiError].
  /// It handles:
  /// - Firebase authentication errors (using [FirebaseAuthExceptionHandler])
  /// - Network connection errors (using [NetworkException])
  ///
  /// [error]: The error to be mapped to an [ApiError].
  ///
  /// Returns an [ApiError] with a relevant message based on the error type.
  static ApiError _mapErrorToApiError(dynamic error) {
    if (error is FirebaseAuthException) {
      final String errorMessage = FirebaseAuthExceptionHandler.handleErrorCode(error.code);
      return ApiError(message: errorMessage);
    } else if (error is NetworkException) {
      return const ApiError(message: "Network error. Please check your internet connection.");
    }

    return const ApiError(message: "An unexpected error occurred.");
  }
}

/// Represents an API error with a message.
///
/// This class holds an error message to provide information about an API error.
class ApiError {
  /// The error message associated with this [ApiError].
  final String message;

  /// Creates an [ApiError] instance.
  ///
  /// [message]: The error message to be associated with this error.
  const ApiError({required this.message});
}

/// Extension on [String] for providing localized error messages.
///
/// This extension allows strings to be converted into localized error messages based on
/// the application's localization context.
extension LocalizedError on String {
  /// Retrieves the localized error message based on the given [context].
  ///
  /// This method maps error strings to localized error messages defined in the
  /// [AppLocalizations] class.
  ///
  /// [context]: The [BuildContext] used to access the localization resources.
  ///
  /// Returns the localized error message corresponding to the error string.
  String getErrorMessage(BuildContext context) {
    final AppLocalizations localizations = context.locale;  // Assuming context.locale is AppLocalizations

    switch (this) {
      case 'Wrong password provided.':
        return localizations.wrongPassword;
      case 'No user found with this email.':
        return localizations.userNotFound;
      case 'The email is already registered.':
        return localizations.emailAlreadyInUse;
      case 'Network error. Please check your internet connection.':
        return localizations.networkRequestFailed;
      case 'An account exists with a different credential.':
        return localizations.accountExistsWithDifferentCredential;
      case 'The email or password is invalid.':
        return localizations.invalidCredential;
      case 'This credential is already associated with a different account.':
        return localizations.credentialAlreadyInUse;
      case 'Please log in again to perform this operation.':
        return localizations.requiresRecentLogin;
      case 'The provider has already been linked to the user account.':
        return localizations.providerAlreadyLinked;
      case 'The user\'s credential is no longer valid.':
        return localizations.invalidUserToken;
      case 'The user\'s credential has expired.':
        return localizations.userTokenExpired;
      case 'The phone number is invalid.':
        return localizations.invalidPhoneNumber;
      default:
        return localizations.unexpectedError;
    }
  }
}

/// Handles FirebaseAuth error codes and returns the corresponding error message.
///
/// This class is responsible for mapping FirebaseAuth error codes to user-friendly error messages.
class FirebaseAuthExceptionHandler {
  /// Handles FirebaseAuth error codes and returns the corresponding error message.
  ///
  /// [errorCode]: The FirebaseAuth error code to be converted to an error message.
  ///
  /// Returns the corresponding error message for the given error code.
  static String handleErrorCode(String errorCode) {
    switch (errorCode) {
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'email-already-in-use':
        return 'The email is already registered.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      case 'account-exists-with-different-credential':
        return 'An account exists with a different credential.';
      case 'invalid-credential':
        return 'The email or password is invalid.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different account.';
      case 'requires-recent-login':
        return 'Please log in again to perform this operation.';
      case 'provider-already-linked':
        return 'The provider has already been linked to the user account.';
      case 'invalid-user-token':
        return 'The user\'s credential is no longer valid.';
      case 'user-token-expired':
        return 'The user\'s credential has expired.';
      case 'invalid-phone-number':
        return 'The phone number is invalid.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}