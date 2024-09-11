
import 'package:social_media/core/api/error_handler.dart';

sealed class ApiResult<T>{
  const ApiResult();
}

final class ApiSuccess<T> extends ApiResult<T>{
  final T data;
  const ApiSuccess({required this.data});
}

final class ApiFailure<T> extends ApiResult<T>{
  final ErrorHandler errorHandler;
  const ApiFailure({required this.errorHandler});
}