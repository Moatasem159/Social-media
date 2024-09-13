import 'package:flutter/material.dart';
import 'package:social_media/features/auth/presentation/widgets/forgot_password/forgot_password_dialog.dart';
import 'package:social_media/features/auth/presentation/widgets/forgot_password/forgot_password_form.dart';

class ForgotScreenBody extends StatelessWidget {
  const ForgotScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ForgotPasswordDialog(),
          ForgotPassForm(),
        ],
      ),
    );
  }
}