import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginDataSource {
  Future<AuthResponse> signIn(String email, String password);
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
}