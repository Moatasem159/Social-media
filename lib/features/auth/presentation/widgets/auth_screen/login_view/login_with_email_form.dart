import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/input_validation.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/login_view/remember_me_and_forgot_password.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/password_suffix.dart';

class LoginWithEmailForm extends StatefulWidget {
  const LoginWithEmailForm({super.key});

  @override
  State<LoginWithEmailForm> createState() => _LoginWithEmailFormState();
}

class _LoginWithEmailFormState extends State<LoginWithEmailForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late AutovalidateMode _autoValidateMode;
  late bool _isPasswordObscure;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _autoValidateMode = AutovalidateMode.disabled;
    _isPasswordObscure = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _login() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginWithEmailAndPasswordStates(
          email: _emailController.text, password: _passwordController.text);
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  _changePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener:context.read<LoginCubit>().listener,
      child: SliverToBoxAdapter(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              AuthTextFormField(
                prefix: Icons.email_outlined,
                controller: _emailController,
                autoValidateMode: _autoValidateMode,
                validator: (String? email) =>
                    InputValidator.validateEmail(email!, context),
                hintText: context.locale.enterYourEmail,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
              ),
              AuthTextFormField(
                prefix: Icons.lock_outline_rounded,
                controller: _passwordController,
                isObscure: _isPasswordObscure,
                autoValidateMode: _autoValidateMode,
                validator: (String? password) =>
                    InputValidator.validatePassword(password!, context, true),
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                hintText: context.locale.enterYourPassword,
                suffix: PasswordSuffix(
                    onTap: _changePasswordVisibility,
                    isObscure: _isPasswordObscure),
              ),
              verticalSpace(10),
              const RememberMeAndForgotPassword(),
              verticalSpace(14),
              Center(
                child: BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator(
                        strokeWidth: 1,
                      );
                    }
                    return MainButton(
                      title: context.locale.loginWithProvider("login"),
                      onTap: _login,
                    );
                  },
                ),
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}