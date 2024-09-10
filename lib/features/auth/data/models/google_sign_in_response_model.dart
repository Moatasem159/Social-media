import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleSignInResponseModel{

  final bool firstLogin;
  final AuthResponse authResponse;
  const GoogleSignInResponseModel({required this.firstLogin, required this.authResponse});
}