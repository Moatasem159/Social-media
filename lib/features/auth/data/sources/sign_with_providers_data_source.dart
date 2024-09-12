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
    final SupabaseClient client = Supabase.instance.client;
    final GoogleSignInAuthentication? googleAuth = await _getGoogleAuth();
    final AuthResponse authResponse =
        await _getAuthResponse(googleAuth!, client);
    final bool firstLogin = await _checkNewUser(authResponse.user!.id, client);
    return SignWithGoogleResponseModel(
        firstLogin: firstLogin, authResponse: authResponse);
  }

  @override
  Future<SignWithFacebookResponseModel> faceBookSignIn() async {
    //TODO: fix first login
    final SupabaseClient client = Supabase.instance.client;
    bool login = await client.auth.signInWithOAuth(OAuthProvider.facebook,
        authScreenLaunchMode: LaunchMode.inAppBrowserView);
    if (login) {
      final Session? session = client.auth.currentSession;
      final bool firstLogin = await _checkNewUser(session!.user.id, client);
      return SignWithFacebookResponseModel(
          firstLogin: firstLogin, user: session.user);
    } else {
      return const SignWithFacebookResponseModel();
    }
  }

  @override
  Future<void> setUserData(UserData user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }

  Future<GoogleSignInAuthentication>? _getGoogleAuth() async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn(serverClientId: Env.webClientId);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    return await googleUser!.authentication;
  }

  Future<AuthResponse> _getAuthResponse(
      GoogleSignInAuthentication googleAuth, SupabaseClient client) async {
    return await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
      accessToken: googleAuth.accessToken,
    );
  }

  Future<bool> _checkNewUser(String userId, SupabaseClient client) async {
    bool firstLogin;
    final PostgrestList data =
        await client.from('users').select().eq("id", userId);
    firstLogin = data.isEmpty;
    return firstLogin;
  }
}