import 'package:flutter/material.dart';
import 'package:social_media/core/lang/app_localizations_setup.dart';
import 'package:social_media/core/routing/app_router.dart';
class Socialfy extends StatelessWidget {
  final AppRouter router;
  const Socialfy({super.key, required this.router});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.router,
      themeMode: ThemeMode.system,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
    );
  }
}