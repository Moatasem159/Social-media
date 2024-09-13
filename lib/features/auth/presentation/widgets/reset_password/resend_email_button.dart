import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';

class ResendEmailButton extends StatelessWidget {
  final String email;
  const ResendEmailButton({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.locale.resetEmailSent),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
            );
          }
          if (state is ResetPasswordErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.message.getErrorMessage(context)),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ResetPasswordLoadingState) {
            return const CircularProgressIndicator(strokeWidth: 1);
          }
          return MainButton(
            elevation: 2,
            border: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: context.theme.primaryColor),
            ),
            backgroundColor: context.theme.scaffoldBackgroundColor,
            foregroundColor: context.theme.primaryColor,
            title: context.locale.resendEmail,
            onTap:()=> context.read<ResetPasswordCubit>().resetPassword(email),
          );
        },
      ),
    );
  }
}