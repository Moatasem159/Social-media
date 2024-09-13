import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Abstract class defining the contract for various sign-in methods.
///
/// This class serves as a blueprint for implementing different sign-in strategies,
/// such as email/password, Google, Facebook, and Twitter.
///
/// Each concrete implementation of this class should provide the actual sign-in
/// logic for a specific method.
abstract class SignInMethod {
  /// Signs in a user using the specific sign-in method.
  ///
  /// This method should be implemented to perform the actual sign-in operation.
  ///
  /// Returns:
  /// - [Future<UserCredential>]: The credentials of the signed-in user.
  Future<UserCredential> signIn();
}

/// Sign-in method using email and password.
///
/// This class provides functionality to sign in a user using their email and password.
class SignInWithEmailAndPassword implements SignInMethod {
  final String email;
  final String password;

  /// Constructor for [SignInWithEmailAndPassword].
  ///
  /// Parameters:
  /// - [email]: The email address of the user.
  /// - [password]: The password for the user.
  const SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  @override
  Future<UserCredential> signIn() async {
    // Sign in with email and password using Firebase Authentication.
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

/// Sign-in method using Google.
///
/// This class provides functionality to sign in a user using their Google account.
class SignInWithGoogle implements SignInMethod {
  @override
  Future<UserCredential> signIn() async {
    // Initiate Google sign-in process.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a credential using the Google authentication tokens.
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    // Sign in with the created credential using Firebase Authentication.
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

/// Sign-in method using Facebook.
///
/// This class provides functionality to sign in a user using their Facebook account.
class SignInWithFacebook implements SignInMethod {
  @override
  Future<UserCredential> signIn() async {
    // Initiate Facebook login process.
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential using the Facebook access token.
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Sign in with the created credential using Firebase Authentication.
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
}

/// Sign-in method using Twitter.
///
/// This class provides functionality to sign in a user using their Twitter account.
class SignInWithTwitter implements SignInMethod {
  @override
  Future<UserCredential> signIn() async {
    // Create a TwitterAuthProvider instance.
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();

    // Sign in with Twitter using Firebase Authentication.
    return await FirebaseAuth.instance.signInWithProvider(twitterProvider);
  }
}