import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:social_media/bloc_observer.dart';
import 'package:social_media/core/api/env.dart';
import 'package:social_media/core/api/network_info.dart';
import 'package:social_media/features/auth/data/repositories/register_repository_impl.dart';
import 'package:social_media/features/auth/data/sources/register_data_source.dart';
import 'package:social_media/features/auth/domain/repositories/register_repository.dart';
import 'package:social_media/features/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Bloc.observer = AppBlocObserver();
  await _initializeSupabase();
  await _setupNetworkChecker();
  await _setupRegisterDependencies();
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