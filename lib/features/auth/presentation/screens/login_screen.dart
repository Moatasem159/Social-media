import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/dependence_injection.dart';
import 'package:social_media/core/theme/app_theme.dart';
import 'package:social_media/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/login_screen/screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(getIt(),getIt()),
      child: AnnotatedRegion(
        value: AppTheme.systemUiOverlayStyle(context),
        child: const SafeArea(
          child: Scaffold(
            body: LoginScreenBody(),
          ),
        ),
      ),
    );
  }
}