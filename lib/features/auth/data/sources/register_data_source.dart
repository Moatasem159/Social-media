import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class RegisterDataSource {
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password,UserData userData);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password,UserData userData) async {
    final FirebaseAuth authClient = FirebaseAuth.instance;
    final UserCredential credential = await authClient.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    UserData user = UserData(
      uId: credential.user!.uid,
      username: userData.username,
      phoneNumber: userData.phoneNumber,
    );
    _setUserData(user);
    return credential;
  }

  Future<void> _setUserData(UserData user) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('users').insert(user.toJson());
  }
}