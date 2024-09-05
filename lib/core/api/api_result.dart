
sealed class ApiResult<T>{
  const ApiResult();
}

final class ApiSuccess<T> extends ApiResult<T>{
  final T data;
  const ApiSuccess({required this.data});
}
final class ApiFailure<T> extends ApiResult<T>{
  const ApiFailure();
}