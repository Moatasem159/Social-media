import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/theme/app_theme.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/screen_body.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppTheme.systemUiOverlayStyle(context).copyWith(
        systemNavigationBarColor:context.theme.scaffoldBackgroundColor.withOpacity(0.9)
      ),
      child: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor.withOpacity(0.9),
            body: const AuthScreenBody()
          ),
        ),
      ),
    );
  }
}