import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/core/api/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginDataSource {
  Future<AuthResponse> signIn(String email, String password);

  Future<AuthResponse> googleSignIn();
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<AuthResponse> signIn(String email, String password) async {
    final SupabaseClient client = Supabase.instance.client;
    return await client.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  @override
  Future<AuthResponse> googleSignIn() async {
    final SupabaseClient client = Supabase.instance.client;
    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: Env.webClientId);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final String? accessToken = googleAuth.accessToken;
    final String? idToken = googleAuth.idToken;
    return await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken!,
      accessToken: accessToken,
    );
  }
}