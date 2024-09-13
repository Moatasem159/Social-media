import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          AuthTextFormField(
            hintText: context.locale.enterYourEmail,
          ),
          MainButton(
            title: context.locale.resetPassword,
            onTap: () {},
          )
        ],
      ),
    );
  }
}