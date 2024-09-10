import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/core/api/env.dart';
import 'package:social_media/features/auth/data/models/google_sign_in_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginDataSource {
  Future<AuthResponse> signIn(String email, String password);

  Future<GoogleSignInResponseModel> googleSignIn();
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
  Future<GoogleSignInResponseModel> googleSignIn() async {
    final SupabaseClient client = Supabase.instance.client;
    final GoogleSignInAuthentication? googleAuth = await _getGoogleAuth();
    final AuthResponse authResponse =await _getAuthResponse(googleAuth!,client);
    final bool firstLogin=await _checkNewUser(authResponse, client);
    return GoogleSignInResponseModel(firstLogin: firstLogin, authResponse: authResponse);
  }

  Future<GoogleSignInAuthentication>? _getGoogleAuth() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: Env.webClientId);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    return await googleUser!.authentication;
  }
  Future<AuthResponse> _getAuthResponse(GoogleSignInAuthentication googleAuth,SupabaseClient client)async{
    return await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
      accessToken: googleAuth.accessToken,

    );
  }
  Future<bool> _checkNewUser(AuthResponse authResponse, SupabaseClient client) async {
    bool firstLogin;
    final String uId=authResponse.user!.id;
    final PostgrestList data = await client.from('users').select().eq("id", uId);
    if(data.isEmpty){
      firstLogin=true;
    }
    else {
      firstLogin=false;
    }
    return firstLogin;
  }
}