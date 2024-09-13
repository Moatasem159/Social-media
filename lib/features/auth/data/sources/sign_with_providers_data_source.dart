import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
abstract class SignInDataSource {
  Future<void> setUserData(UserData user);
  Future<UserCredential> signIn(SignInMethod signInMethod);
}
class SignInDataSourceImpl extends SignInDataSource {
  @override
  Future<UserCredential> signIn(SignInMethod signInMethod) {
    return signInMethod.signIn();
  }
  @override
  Future<void> setUserData(UserData user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
}