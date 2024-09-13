import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/theme/app_theme.dart';
import 'package:social_media/features/auth/presentation/widgets/forgot_password/screen_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleTextStyle: context.titleMedium,
            title: Text(context.locale.forgotPassword("null")),
          ),
          body: const ForgotScreenBody(),
        ),
      ),
    );
  }
}