import 'package:social_media/core/api/error_handler.dart';

/// A sealed class representing the result of an API call.
///
/// This class is a base class for two possible outcomes: success or failure.
///
/// The generic type [T] represents the type of data returned by the API call in case of success.
///
/// Subclasses:
/// - [ApiSuccess]: Represents a successful API response containing data.
/// - [ApiFailure]: Represents a failed API response containing an [ErrorHandler] to handle errors.
sealed class ApiResult<T> {
  /// Creates an instance of [ApiResult].
  const ApiResult();
}

/// Represents a successful API response.
///
/// Contains the data returned by the API call.
///
/// [T] is the type of the data returned.
///
/// Example usage:
/// ```dart
/// final result = ApiSuccess(data: myData);
/// ```
final class ApiSuccess<T> extends ApiResult<T> {
  /// The data returned by the API call.
  final T data;

  /// Creates an instance of [ApiSuccess].
  ///
  /// The [data] parameter must be provided and cannot be null.
  const ApiSuccess({required this.data});
}

/// Represents a failed API response.
///
/// Contains an [ErrorHandler] that provides information about the error.
///
/// [T] is a placeholder for the data type which is not relevant in case of failure.
///
/// Example usage:
/// ```dart
/// final result = ApiFailure(errorHandler: myErrorHandler);
/// ```
final class ApiFailure<T> extends ApiResult<T> {
  /// The error handler that provides details about the failure.
  final ErrorHandler errorHandler;

  /// Creates an instance of [ApiFailure].
  ///
  /// The [errorHandler] parameter must be provided and cannot be null.
  const ApiFailure({required this.errorHandler});
}