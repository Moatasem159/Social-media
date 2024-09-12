import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignWithProviderResponseModel {
  final bool? firstLogin;

  const SignWithProviderResponseModel({this.firstLogin});
}

class SignWithGoogleResponseModel extends SignWithProviderResponseModel {
  final AuthResponse? authResponse;

  const SignWithGoogleResponseModel({super.firstLogin, this.authResponse});
}

class SignWithFacebookResponseModel extends SignWithProviderResponseModel {
  final User? user;

  const SignWithFacebookResponseModel({super.firstLogin, this.user});
}