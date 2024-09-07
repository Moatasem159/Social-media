import 'package:supabase_flutter/supabase_flutter.dart';

class ErrorHandler implements Exception{
  late ApiError apiError;
  ErrorHandler.handle(dynamic error) {
    if (error is AuthException) {
      apiError=ApiError(message: error.message);
    }
    else{
      apiError = ApiError(message:error.toString());
    }
  }
}

class ApiError{
  final String message;
  ApiError({required this.message});
}