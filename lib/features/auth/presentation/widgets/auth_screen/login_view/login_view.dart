import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/dependence_injection.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/continue_with_email.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/login_view/login_with_email_form.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/login_view/login_with_providers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(getIt(), getIt()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: CustomScrollView(
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          slivers: [
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            verticalSliverSpace(28),
            const LoginWithProviders(),
            const ContinueWithEmail(),
            const LoginWithEmailForm(),
          ],
        ),
      ),
    );
  }
}