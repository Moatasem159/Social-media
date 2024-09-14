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
part 'auth_routes.dart';

class AppRouter {
  final GoRouter router = GoRouter(
      initialLocation: "/", routes: $appRoutes, debugLogDiagnostics: true);
}

@TypedGoRoute<InitialRoute>(path: '/')
class InitialRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeScreen();
}