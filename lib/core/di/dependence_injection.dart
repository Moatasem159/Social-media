import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:social_media/bloc_observer.dart';
import 'package:social_media/core/api/env.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/repositories/login_repository_impl.dart';
import 'package:social_media/features/auth/data/repositories/register_repository_impl.dart';
import 'package:social_media/features/auth/data/repositories/sign_with_provider_repository_impl.dart';
import 'package:social_media/features/auth/data/sources/login_data_source.dart';
import 'package:social_media/features/auth/data/sources/register_data_source.dart';
import 'package:social_media/features/auth/data/sources/sign_with_providers_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/login_repository.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';
import 'package:social_media/features/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/set_user_data_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_with_facebook_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:social_media/features/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Bloc.observer = AppBlocObserver();
  await _initializeSupabase();
  await _setupNetworkChecker();
  await _setupRegisterDependencies();
  await _setupLoginDependencies();
  await _setupSignWithProviderDependencies();
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
  getIt.registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl());
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<RegisterWithEmailAndPasswordUsecase>(
    () => RegisterWithEmailAndPasswordUsecase(getIt()),
  );
}

_setupLoginDependencies() async {
  getIt.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<LoginWithEmailAndPasswordUsecase>(
    () => LoginWithEmailAndPasswordUsecase(getIt()),
  );
}

_setupSignWithProviderDependencies() {
  getIt.registerLazySingleton<SignWithProviderDataSource>(
      () => SignWithProviderDataSourceImpl());
  getIt.registerLazySingleton<SignWithProviderRepository>(
      () => SignWithProviderRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<SignWithGoogleUsecase>(
      () => SignWithGoogleUsecase(getIt()));
  getIt.registerLazySingleton<SignWithFacebookUsecase>(
      () => SignWithFacebookUsecase(getIt()));
  getIt.registerLazySingleton<SetUserDataUsecase>(
      () => SetUserDataUsecase(getIt()));
}