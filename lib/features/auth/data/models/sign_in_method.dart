import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignInMethod {
  Future<UserCredential> signIn();
}

class SignInWithEmailAndPassword implements SignInMethod {
  final String email;
  final String password;

  const SignInWithEmailAndPassword(
      {required this.email, required this.password});

  @override
  Future<UserCredential> signIn() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      password: password,
      email: email,
    );
  }
}

class SignInWithGoogle implements SignInMethod {
  @override
  Future<UserCredential> signIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class SignInWithFacebook implements SignInMethod {
  @override
  Future<UserCredential> signIn() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
}

class SignInWithTwitter implements SignInMethod {
  @override
  Future<UserCredential> signIn() async {
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(twitterProvider);
  }
}