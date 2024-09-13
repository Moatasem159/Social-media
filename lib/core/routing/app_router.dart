import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media/core/routing/animations_route/slide_from_right_to_left.dart';
import 'package:social_media/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:social_media/features/auth/presentation/screens/auth_screen.dart';
import 'package:social_media/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:social_media/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:social_media/features/auth/presentation/screens/welcome_screen.dart';

part 'app_router.g.dart';

class AppRouter {
  final GoRouter router = GoRouter(initialLocation: "/", routes: $appRoutes);
}

@TypedGoRoute<InitialRoute>(path: '/')
class InitialRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeScreen();
}

@TypedGoRoute<AuthRoute>(path: '/authRoute')
class AuthRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(child: const AuthScreen());
  }
}

@TypedGoRoute<ForgotPasswordRoute>(path: '/forgotPasswordRoute')
class ForgotPasswordRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(child: const ForgotPasswordScreen());
  }
}

@TypedGoRoute<ResetPasswordRoute>(path: '/resetPasswordRoute')
class ResetPasswordRoute extends GoRouteData {
  final String email;

  final ResetPasswordCubit $extra;

  const ResetPasswordRoute(this.$extra,{required this.email});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(
      child: BlocProvider.value(
        value: $extra,
        child: ResetPasswordScreen(email: email),
      ),
    );
  }
}