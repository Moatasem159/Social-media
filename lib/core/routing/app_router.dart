import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media/features/auth/presentation/screens/welcome_screen.dart';
part 'app_router.g.dart';
class AppRouter{
  final GoRouter router=GoRouter(
    initialLocation: "/",
    routes: $appRoutes
  );
}


@TypedGoRoute<InitialRoute>(path: '/')
class InitialRoute extends GoRouteData{
  @override
  Widget build(BuildContext context, GoRouterState state) =>const WelcomeScreen();
}