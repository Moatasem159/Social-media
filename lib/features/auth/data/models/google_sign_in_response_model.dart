import 'package:supabase_flutter/supabase_flutter.dart';

class SignWithProviderResponseModel{

  final bool firstLogin;
  final AuthResponse authResponse;
  const SignWithProviderResponseModel({required this.firstLogin, required this.authResponse});
}