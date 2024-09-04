import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
///Extension to get screen size.
extension SizeExtension on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
}
///Extension for themes.
extension ThemesExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDark=>theme.brightness==Brightness.dark;
  TextStyle get titleMedium=>theme.textTheme.titleMedium!;
}
///Extension for app localizations.
extension LocalizationExtentions on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}