import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Abstract class defining the contract for user registration data sources.
///
/// This class outlines the method required for user registration with email and password,
/// including saving user data to the data source.
abstract class RegisterDataSource {
  /// Creates a new user with email and password, and saves user data.
  ///
  /// Parameters:
  /// - [email]: The email address for the new user.
  /// - [password]: The password for the new user.
  /// - [userData]: An instance of [UserData] containing additional user information.
  ///
  /// Returns:
  /// - [Future<UserCredential>]: A future that completes with the credentials of the newly created user.
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password, UserData userData);
}

/// Implementation of [RegisterDataSource] using Firebase Authentication and Supabase.
///
/// This class provides concrete implementation for creating a new user with email and password,
/// and storing additional user data in Supabase.
class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password, UserData userData) async {
    // Obtain an instance of FirebaseAuth.
    final FirebaseAuth authClient = FirebaseAuth.instance;

    // Create a new user with email and password using Firebase Authentication.
    final UserCredential credential = await authClient.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    // Create a UserData instance with the newly created user's ID and provided user data.
    UserData user = UserData(
      uId: credential.user!.uid,
      username: userData.username,
      phoneNumber: userData.phoneNumber,
    );

    // Save user data to Supabase.
    await _setUserData(user);

    // Return the credentials of the newly created user.
    return credential;
  }

  /// Saves user data to Supabase.
  ///
  /// Parameters:
  /// - [user]: An instance of [UserData] containing user information to be saved.
  ///
  /// Returns:
  /// - [Future<void>]: A future that completes when the user data has been successfully saved.
  Future<void> _setUserData(UserData user) async {
    // Obtain an instance of SupabaseClient.
    final SupabaseClient client = Supabase.instance.client;

    // Insert user data into the 'users' table in Supabase.
    await client.from('users').insert(user.toJson());
  }
}