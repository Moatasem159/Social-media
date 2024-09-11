import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/core/api/env.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignWithProviderDataSource {
  Future<void> setUserData(UserData user);
  Future<SignWithProviderResponseModel> googleSignIn();
}

class SignWithProviderDataSourceImpl extends SignWithProviderDataSource {
  @override
  Future<SignWithProviderResponseModel> googleSignIn() async {
    final SupabaseClient client = Supabase.instance.client;
    final GoogleSignInAuthentication? googleAuth = await _getGoogleAuth();
    final AuthResponse authResponse =
        await _getAuthResponse(googleAuth!, client);
    final bool firstLogin = await _checkNewUser(authResponse, client);
    return SignWithProviderResponseModel(
        firstLogin: firstLogin, authResponse: authResponse);
  }
  @override
  Future<void> setUserData(UserData user)async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
  Future<GoogleSignInAuthentication>? _getGoogleAuth() async {
    final GoogleSignIn googleSignIn =
    GoogleSignIn(serverClientId: Env.webClientId);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    return await googleUser!.authentication;
  }

  Future<AuthResponse> _getAuthResponse(GoogleSignInAuthentication googleAuth, SupabaseClient client) async {
    return await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
      accessToken: googleAuth.accessToken,
    );
  }

  Future<bool> _checkNewUser(AuthResponse authResponse, SupabaseClient client) async {
    bool firstLogin;
    final String? uId = authResponse.user?.id;
    final PostgrestList data = await client.from('users').select().eq("id", uId!);
    firstLogin=data.isEmpty;
    return firstLogin;
  }
}