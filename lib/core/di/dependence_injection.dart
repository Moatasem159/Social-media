import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:social_media/bloc_observer.dart';
import 'package:social_media/core/api/env.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:social_media/features/auth/data/sources/auth_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/auth_repository.dart';
import 'package:social_media/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/set_user_data_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:social_media/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Bloc.observer = AppBlocObserver();
  await _initializeSupabase();
  await _setupFirebase();
  await _setupNetworkChecker();
  await _setupRegisterDependencies();
  await _setupSignInDependencies();
}

_setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

_setupNetworkChecker() async {
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.createInstance());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
}

_initializeSupabase() async {
  await Supabase.initialize(
    url: Env.baseUrl,
    anonKey: Env.apiKey,
  );
}

_setupRegisterDependencies() async {
  getIt.registerLazySingleton<RegisterWithEmailAndPasswordUsecase>(
    () => RegisterWithEmailAndPasswordUsecase(getIt()),
  );
}

_setupSignInDependencies() {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<SignInUsecase>(() => SignInUsecase(getIt()));
  getIt.registerLazySingleton<SetUserDataUsecase>(
      () => SetUserDataUsecase(getIt()));
  getIt.registerLazySingleton<ResetPasswordUsecase>(
          () => ResetPasswordUsecase(getIt()));
}