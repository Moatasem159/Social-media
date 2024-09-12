import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<UserCredential> signIn(String email, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<UserCredential> signIn(String email, String password) async {
    final FirebaseAuth authClient = FirebaseAuth.instance;
    return await authClient.signInWithEmailAndPassword(
      password: password,
      email: email,
    );
  }
}