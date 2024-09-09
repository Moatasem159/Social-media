import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterDataSource {
  Future<AuthResponse> createUserWithEmailAndPassword(String email, String password);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<AuthResponse> createUserWithEmailAndPassword(String email, String password) async {
    final SupabaseClient client = Supabase.instance.client;
    return await client.auth.signUp(
      password: password,
      email: email,
      emailRedirectTo: "io.supabase.socialfy://login-callback/"
    );
  }
}