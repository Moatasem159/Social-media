import 'package:get_it/get_it.dart';
import 'package:social_media/core/api/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  await _initializeSupabase();
}

_initializeSupabase() async {
  await Supabase.initialize(
    url: Env.baseUrl,
    anonKey: Env.apiKey,
  );
}