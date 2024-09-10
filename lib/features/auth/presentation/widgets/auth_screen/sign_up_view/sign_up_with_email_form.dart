import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/password_suffix.dart';

class SignUpWithEmail extends StatelessWidget {
  const SignUpWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        child: Column(
          children: [
            verticalSpace(16),
            AuthTextFormField(
              prefix: Icons.account_circle_outlined,
              hintText: context.locale.enterYourName,
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            AuthTextFormField(
              prefix: Icons.email_outlined,
              hintText: context.locale.enterYourEmail,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),
            AuthTextFormField(
              prefix: Icons.local_phone_outlined,
              hintText: context.locale.enterYourPhoneNumber,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            AuthTextFormField(
              prefix: Icons.lock_outline_rounded,
              hintText: context.locale.enterYourPassword,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              suffix: PasswordSuffix(
                onTap: () {},
                isObscure: true,
              ),
            ),
            verticalSpace(15),
            MainButton(
              title: context.locale.signUpWithProvider("signUp"),
              onTap: () {},
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}