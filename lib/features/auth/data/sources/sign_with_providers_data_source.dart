import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/core/api/env.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


abstract class SignWithProviderDataSource {
  Future<void> setUserData(UserData user);

  Future<SignWithGoogleResponseModel> googleSignIn();

  Future<SignWithFacebookResponseModel> faceBookSignIn();
}

class SignWithProviderDataSourceImpl extends SignWithProviderDataSource {
  @override
  Future<SignWithGoogleResponseModel> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
    return SignWithGoogleResponseModel(firstLogin: userCredential.additionalUserInfo!.isNewUser,userCredential: userCredential);
  }
  @override
  Future<SignWithFacebookResponseModel> faceBookSignIn() async {
    // //TODO: fix first login
    // final SupabaseClient client = Supabase.instance.client;
    // bool login = await client.auth.signInWithOAuth(OAuthProvider.facebook,
    //     authScreenLaunchMode: LaunchMode.inAppBrowserView);
    // if (login) {
    //   final Session? session = client.auth.currentSession;
    //   final bool firstLogin = await _checkNewUser(session!.user.id, client);
    //   return SignWithFacebookResponseModel(
    //       firstLogin: firstLogin, user: session.user);
    // } else {
    //   return const SignWithFacebookResponseModel();
    // }
    throw UnimplementedError();
  }
  @override
  Future<void> setUserData(UserData user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
}