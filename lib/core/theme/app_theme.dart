import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/core/extensions/context_extensions.dart';

part 'app_colors.dart';

class AppTheme {
  ///Light theme data.
  final ThemeData lightThemeData = ThemeData(
    fontFamily: "beVietnamPro",
    fontFamilyFallback: const ["beVietnamPro"],
    brightness: Brightness.light,
    primaryColor: AppColor.lightPrimaryColor,
    scaffoldBackgroundColor: AppColor.lightScaffoldBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: AppColor.lightPrimaryColor,
        foregroundColor: AppColor.darkPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        fixedSize: const Size(double.maxFinite, 40),
        textStyle: _labelMedium,
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: _labelMedium,
    ),
    checkboxTheme: CheckboxThemeData(
      splashRadius: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      elevation: 5,
    ),
    tabBarTheme: TabBarTheme(
        indicatorColor: AppColor.lightPrimaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColor.lightPrimaryColor,
        labelPadding: const EdgeInsets.symmetric(vertical: 6),
        overlayColor: const WidgetStatePropertyAll(Colors.black12),
        unselectedLabelColor: Colors.grey),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor.lightPrimaryColor,
    ),
  );

  ///Dark theme data.
  final ThemeData darkThemeData = ThemeData(
    fontFamily: "beVietnamPro",
    fontFamilyFallback: const ["beVietnamPro"],
    brightness: Brightness.dark,
    primaryColor: AppColor.darkPrimaryColor,
    scaffoldBackgroundColor: AppColor.darkScaffoldBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: AppColor.darkPrimaryColor,
        foregroundColor: AppColor.lightPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        fixedSize: const Size(double.maxFinite, 40),
        textStyle: _labelMedium,
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: _labelMedium,
    ),
    checkboxTheme: CheckboxThemeData(
      splashRadius: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      elevation: 5,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColor.darkPrimaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColor.darkPrimaryColor,
      labelPadding: const EdgeInsets.symmetric(vertical: 6),
      unselectedLabelColor: Colors.grey,
      overlayColor: const WidgetStatePropertyAll(Colors.white12),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor.darkPrimaryColor,
    ),
  );
  static const TextStyle _labelMedium = TextStyle(
    fontFamily: "beVietnamPro",
    fontSize: 16,
    height: 1,
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