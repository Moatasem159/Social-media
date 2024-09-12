import 'package:firebase_auth/firebase_auth.dart';

abstract class SignWithProviderResponseModel {
  final bool? firstLogin;
  const SignWithProviderResponseModel({this.firstLogin});
}

class SignWithGoogleResponseModel extends SignWithProviderResponseModel {
  final UserCredential? userCredential;

  const SignWithGoogleResponseModel({super.firstLogin, this.userCredential});
}

class SignWithFacebookResponseModel extends SignWithProviderResponseModel {
  final UserCredential? userCredential;

  const SignWithFacebookResponseModel({super.firstLogin, this.userCredential});
}