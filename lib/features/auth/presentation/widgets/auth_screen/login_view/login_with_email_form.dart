import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/login_view/remember_me_and_forgot_password.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:social_media/features/auth/presentation/widgets/password_suffix.dart';
class LoginWithEmailForm extends StatelessWidget {
  const LoginWithEmailForm({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            AuthTextFormField(
              prefix: Icons.email_outlined,
              hintText: context.locale.enterYourEmail,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),
            AuthTextFormField(
              prefix: Icons.lock_outline_rounded,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              hintText: context.locale.enterYourPassword,
              suffix: PasswordSuffix(onTap: () {}, isObscure: false),
            ),
            verticalSpace(10),
            const RememberMeAndForgotPassword(),
            verticalSpace(14),
            MainButton(
              title: context.locale.loginWithProvider("login"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}