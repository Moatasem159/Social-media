import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterDataSource {
  Future<AuthResponse> createUserWithEmailAndPassword(String email, String password,UserData userData);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<AuthResponse> createUserWithEmailAndPassword(String email, String password,UserData userData) async {
    final SupabaseClient client = Supabase.instance.client;
    AuthResponse response = await client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: "io.supabase.socialfy://login-callback/",
      data: {
        "full_name":userData.username
      }
    );
    UserData user = UserData(
      uId: response.user!.id,
      username: userData.username,
      phoneNumber: userData.phoneNumber,
    );
    _setUserData(user);
    return response;
  }

  Future<void> _setUserData(UserData user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
}