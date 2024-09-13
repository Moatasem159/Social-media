import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/dependence_injection.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/theme/app_theme.dart';
import 'package:social_media/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/forgot_password/screen_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => ResetPasswordCubit(getIt()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
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
      ),
    );
  }
}