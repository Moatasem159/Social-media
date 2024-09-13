import 'package:flutter/material.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/auth_screen_app_bar.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/login_view/login_view.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/sign_up_view/sign_up_view.dart';
class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const AuthScreenAppBar(),
        ];
      },
      body: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          LoginView(
            key: ValueKey("loginView"),
          ),
          SignUpView(
            key: ValueKey("signUpView"),
          ),
        ],
      ),
    );
  }
}