
import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandler implements Exception{
  late ApiError apiError;
  ErrorHandler.handle(dynamic error) {
    if (error is FirebaseAuthException) {
      apiError=ApiError(message: error.message!);
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