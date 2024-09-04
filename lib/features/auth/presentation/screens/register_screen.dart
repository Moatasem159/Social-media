import 'package:flutter/material.dart';
import 'package:social_media/core/theme/app_theme.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppTheme.systemUiOverlayStyle(context),
      child: const SafeArea(
        child: Scaffold(),
      ),
    );
  }
}