import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/input_validation.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/password_suffix.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late AutovalidateMode _autoValidateMode;
  late bool _isPasswordObscure;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _autoValidateMode = AutovalidateMode.disabled;
    _isPasswordObscure = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signUp() {
    if (_formKey.currentState!.validate()) {
      UserData userData = UserData(
        username: _nameController.text,
        phoneNumber: _phoneController.text,
      );
      context.read<RegisterCubit>().emitRegisterStates(
            _emailController.text,
            _passwordController.text,
            userData,
          );
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
    return BlocListener<RegisterCubit, RegisterStates>(
      listener: context.read<RegisterCubit>().listener,
      child: SliverToBoxAdapter(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              verticalSpace(16),
              AuthTextFormField(
                prefix: Icons.account_circle_outlined,
                autoValidateMode: _autoValidateMode,
                controller: _nameController,
                validator: (String? name) =>
                    InputValidator.validateName(name!, context),
                hintText: context.locale.enterYourName,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              AuthTextFormField(
                prefix: Icons.email_outlined,
                autoValidateMode: _autoValidateMode,
                controller: _emailController,
                validator: (String? email) =>
                    InputValidator.validateEmail(email!, context),
                hintText: context.locale.enterYourEmail,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
              ),
              AuthTextFormField(
                prefix: Icons.local_phone_outlined,
                autoValidateMode: _autoValidateMode,
                controller: _phoneController,
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                validator: (String? phoneNumber) =>
                    InputValidator.validateEgyptianPhoneNumber(
                        phoneNumber!, context),
                hintText: context.locale.enterYourPhoneNumber,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              AuthTextFormField(
                prefix: Icons.lock_outline_rounded,
                autoValidateMode: _autoValidateMode,
                isObscure: _isPasswordObscure,
                controller: _passwordController,
                validator: (String? password) =>
                    InputValidator.validatePassword(password!, context),
                hintText: context.locale.enterYourPassword,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                suffix: PasswordSuffix(
                  onTap: _changePasswordVisibility,
                  isObscure: _isPasswordObscure,
                ),
              ),
              verticalSpace(8),
              BlocBuilder<RegisterCubit, RegisterStates>(
                builder: (context, state) {
                  if (state is RegisterLoadingState) {
                    return const CircularProgressIndicator(
                      strokeWidth: 1,
                    );
                  }
                  return MainButton(
                    title: context.locale.signUpWithProvider("signUp"),
                    onTap: _signUp,
                  );
                },
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}