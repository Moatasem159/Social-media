import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
abstract class SignWithProviderDataSource {
  Future<void> setUserData(UserData user);
  Future<SignWithProviderResponseModel> googleSignIn();
  Future<SignWithProviderResponseModel> faceBookSignIn();
  Future<SignWithProviderResponseModel> twitterSignIn();
}
class SignWithProviderDataSourceImpl extends SignWithProviderDataSource {
  @override
  Future<SignWithProviderResponseModel> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
    return SignWithProviderResponseModel(firstLogin: userCredential.additionalUserInfo!.isNewUser,userCredential: userCredential);
  }
  @override
  Future<SignWithProviderResponseModel> faceBookSignIn() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    final UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return SignWithProviderResponseModel(firstLogin: userCredential.additionalUserInfo!.isNewUser,userCredential: userCredential);
  }
  @override
  Future<SignWithProviderResponseModel> twitterSignIn()async {
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();
    final UserCredential userCredential=await FirebaseAuth.instance.signInWithProvider(twitterProvider);
    return SignWithProviderResponseModel(firstLogin: userCredential.additionalUserInfo!.isNewUser,userCredential: userCredential);
  }
  @override
  Future<void> setUserData(UserData user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
}