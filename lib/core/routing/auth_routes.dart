part of 'app_router.dart';
@TypedGoRoute<AuthRoute>(
  path: '/authRoute',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<ForgotPasswordRoute>(
      path: "forgotPasswordRoute",
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<ResetPasswordRoute>(path: "resetPasswordRoute")
      ],
    ),
  ],
)
class AuthRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(child: const AuthScreen());
  }
}

class ForgotPasswordRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideFromRightToLeft(child: const ForgotPasswordScreen());
  }
}

class ResetPasswordRoute extends GoRouteData {
  final String email;

  final ResetPasswordCubit $extra;

  const ResetPasswordRoute(this.$extra, {required this.email});

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