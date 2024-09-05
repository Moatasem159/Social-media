import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/dependence_injection.dart';
import 'package:social_media/core/theme/app_theme.dart';
import 'package:social_media/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/register_screen/screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(getIt()),
      child: AnnotatedRegion(
        value: AppTheme.systemUiOverlayStyle(context),
        child: const SafeArea(
          child: Scaffold(body: RegisterScreenBody()),
        ),
      ),
    );
  }
}