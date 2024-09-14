import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/utils/input_validation.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/core/widgets/snack_bar.dart';
import 'package:social_media/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    super.dispose();
  }

  _resetPassword() {
    if (_formKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().resetPassword(_emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordStates>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          ResetPasswordRoute(email: _emailController.text, context.read<ResetPasswordCubit>()).push(context);
        }
        if (state is ResetPasswordErrorState) {
          context.showSnackBar(snackBar(state.error.message.getErrorMessage(context)));
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Email Field
            AuthTextFormField(
              prefix: Icons.email_outlined,
              textInputAction: TextInputAction.done,
              validator: (String? email) =>
                  InputValidator.validateEmail(email!, context),
              textInputType: TextInputType.emailAddress,
              hintText: context.locale.enterYourEmail,
              controller: _emailController,
            ),
            BlocBuilder<ResetPasswordCubit, ResetPasswordStates>(
              builder: (context, state) {
                if (state is ResetPasswordLoadingState) {
                  return Column(
                    children: [
                      verticalSpace(8),
                      const CircularProgressIndicator(strokeWidth: 1),
                    ],
                  );
                }
                return MainButton(
                  title: context.locale.resetPassword,
                  onTap: _resetPassword,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}