import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media/core/routing/animations_route/slide_from_right_to_left.dart';
import 'package:social_media/features/auth/presentation/screens/login_screen.dart';
import 'package:social_media/features/auth/presentation/screens/register_screen.dart';
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
@TypedGoRoute<LoginRoute>(path: '/loginRoute')
class LoginRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(child: const LoginScreen());
  }
}
@TypedGoRoute<RegisterRoute>(path: '/registerRoute')
class RegisterRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(child: const RegisterScreen());
  }
}