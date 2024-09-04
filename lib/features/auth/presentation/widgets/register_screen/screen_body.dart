import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
part 'password_validations.dart';
part 'screen_title.dart';
part 'register_form.dart';
part 'already_have_account_button.dart';
part 'date_picker_field.dart';
part 'register_policy_text.dart';
class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(50),
              const _RegisterScreenTitle(),
              verticalSpace(20),
              const _RegisterForm(),
              verticalSpace(15),
              const _AlreadyHaveAccountButton(),
              verticalSpace(15),
              const _RegisterPolicyText(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}