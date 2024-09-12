import 'package:firebase_auth/firebase_auth.dart';

class SignWithProviderResponseModel {
  final bool? firstLogin;
  final UserCredential? userCredential;

  const SignWithProviderResponseModel({this.userCredential, this.firstLogin});
}