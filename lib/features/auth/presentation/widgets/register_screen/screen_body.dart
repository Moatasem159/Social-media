import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/input_validation.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:social_media/features/auth/presentation/widgets/password_suffix.dart';
part 'password_validations.dart';
part 'screen_title.dart';
part 'register_form.dart';
part 'already_have_account_button.dart';
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