import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
part 'app_colors.dart';
class AppTheme {
  ///Light theme data.
  final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.lightPrimaryColor,
    scaffoldBackgroundColor: AppColor.lightScaffoldBackground,
  );
  ///Dark theme data.
  final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.darkPrimaryColor,
    scaffoldBackgroundColor: AppColor.darkScaffoldBackground,
  );

  ///Function to change system navigation bar and status bar color
  ///in light and dark themes.
  static SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) =>
      context.theme.brightness == Brightness.light
          ? _whiteSystemUiOverlayStyle
          : _darkSystemUiOverlayStyle;
  static final SystemUiOverlayStyle _whiteSystemUiOverlayStyle =
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColor.lightScaffoldBackground,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.lightScaffoldBackground,
      );
  static final SystemUiOverlayStyle _darkSystemUiOverlayStyle =
      SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: AppColor.darkScaffoldBackground,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColor.darkScaffoldBackground,
  );
}