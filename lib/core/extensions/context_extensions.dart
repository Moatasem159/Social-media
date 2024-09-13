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
  TextStyle get labelLarge=>theme.textTheme.labelLarge!;
  TextStyle get labelMedium=>theme.textTheme.labelMedium!;
  TextStyle get labelSmall=>theme.textTheme.labelSmall!;
  TextStyle get titleLarge=>theme.textTheme.titleLarge!;
  TextStyle get titleMedium=>theme.textTheme.titleMedium!;
  TextStyle get titleSmall=>theme.textTheme.titleSmall!;
  TextStyle get headLineSmall=>theme.textTheme.headlineSmall!;
}
///Extension for app localizations.
extension LocalizationExtentions on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}