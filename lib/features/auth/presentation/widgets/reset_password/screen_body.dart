import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/widgets/reset_password/resend_email_button.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  final String email;

  const ResetPasswordScreenBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(16),
          Text(
            context.locale.resetEmailSent,
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          verticalSpace(6),
          Text(
            email,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.normal),
          ),
          verticalSpace(16),
          MainButton(
            title: context.locale.done,
            onTap: () => AuthRoute().go(context),
          ),
          verticalSpace(10),
          ResendEmailButton(email: email)
        ],
      ),
    );
  }
}