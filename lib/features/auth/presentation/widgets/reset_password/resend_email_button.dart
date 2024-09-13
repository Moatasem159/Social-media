import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/widgets/main_button.dart';

class ResendEmailButton extends StatelessWidget {
  const ResendEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      elevation: 2,
      border: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: context.theme.primaryColor),
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      foregroundColor: context.theme.primaryColor,
      title: context.locale.resendEmail,
      onTap: () {},
    );
  }
}