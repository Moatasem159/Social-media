import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Abstract class defining the contract for sign-in data sources.
///
/// This class outlines the methods required for interacting with data sources related to user sign-in
/// and user data management.
abstract class AuthDataSource {
  /// Signs in a user using a specified sign-in method.
  ///
  /// Parameters:
  /// - [signInMethod]: An instance of [SignInMethod] specifying the sign-in strategy to be used.
  ///
  /// Returns:
  /// - [Future<UserCredential>]: A future that completes with the credentials of the signed-in user.
  Future<UserCredential> signIn(SignInMethod signInMethod);

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

  /// Sets user data in the data source.
  ///
  /// Parameters:
  /// - [user]: An instance of [UserData] containing user information to be saved.
  ///
  /// Returns:
  /// - [Future<void>]: A future that completes when the user data has been successfully set.
  Future<void> setUserData(UserData user);
}

/// Implementation of [AuthDataSource] using Supabase for user data storage.
///
/// This class provides concrete implementations of the methods for signing in users and setting user data.
/// It uses Supabase as the backend service for user data storage.
class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<UserCredential> signIn(SignInMethod signInMethod) {
    // Delegate the sign-in process to the provided sign-in method.
    // This method will return a future that completes with the user credentials.
    return signInMethod.signIn();
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password, UserData userData) async {
    // Create a new user with the provided email and password using FirebaseAuth.
    // Return the credentials of the newly created user.
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> setUserData(UserData user) async {
    // Obtain an instance of SupabaseClient.
    final SupabaseClient client = Supabase.instance.client;

    // Insert user data into the 'users' table in Supabase.
    await client.from('users').insert(user.toJson());
  }
}