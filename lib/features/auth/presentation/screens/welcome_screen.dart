import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/core/theme/app_theme.dart';
import 'package:social_media/features/auth/presentation/widgets/welcome_screen/screen_body.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: const Scaffold(
        body: WelcomeScreenBody()
      ),
    );
  }
}