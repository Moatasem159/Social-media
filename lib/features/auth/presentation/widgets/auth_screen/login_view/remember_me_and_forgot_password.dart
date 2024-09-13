import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/login_view/remember_me_button.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RememberMeCheckbox(
          onChanged: (value) {},
        ),
        const Spacer(),
        GestureDetector(
          onTap: ()=> ForgotPasswordRoute().push(context),
          child: Text(
            context.locale.forgotPassword,
            style: context.labelLarge.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}