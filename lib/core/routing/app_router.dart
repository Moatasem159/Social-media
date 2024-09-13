import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media/core/routing/animations_route/slide_from_right_to_left.dart';
import 'package:social_media/features/auth/presentation/screens/auth_screen.dart';
import 'package:social_media/features/auth/presentation/screens/forgot_password_screen.dart';
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