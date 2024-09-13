import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Text(
          context.locale.forgotPassword("null"),
          style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
        ),
        verticalSpace(8),
        Text(
          context.locale.forgotPasswordDialog,
          style: context.titleSmall.copyWith(fontWeight: FontWeight.normal),
        ),
        verticalSpace(16),
      ],
    );
  }
}