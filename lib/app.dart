import 'package:flutter/material.dart';
import 'package:social_media/core/lang/app_localizations_setup.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/theme/app_theme.dart';
class Socialfy extends StatelessWidget {
  final AppRouter router;
  final AppTheme theme;
  const Socialfy({super.key, required this.router, required this.theme});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.router,
      themeMode: ThemeMode.system,
      theme: theme.lightThemeData,
      darkTheme: theme.darkThemeData,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
    );
  }
}