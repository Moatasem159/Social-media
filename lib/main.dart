import 'package:flutter/material.dart';
import 'package:social_media/app.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/theme/app_theme.dart';

void main() {
  runApp(
    Socialfy(
      router: AppRouter(),
      theme: AppTheme(),
    ),
  );
}