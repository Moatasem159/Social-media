import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/core/extensions/context_extensions.dart';

  class AuthTextFormField extends StatelessWidget {
    final String? hintText;
    final Widget? suffix;
    final TextEditingController? controller;
    final TextInputAction? textInputAction;
    final TextInputType? textInputType;
    final bool isObscure;
    final bool isReadOnly;
    final VoidCallback? onTap;
    final FormFieldValidator<String>? validator;
    final List<TextInputFormatter> ?inputFormatters;
    final AutovalidateMode ?autoValidateMode;

    const AuthTextFormField({
      super.key,
      this.hintText,
      this.suffix,
      this.controller,
      this.textInputAction,
      this.textInputType,
      this.isObscure = false,
      this.isReadOnly = false,
      this.onTap,
      this.validator,
      this.inputFormatters,
      this.autoValidateMode,
    });

    @override
    Widget build(BuildContext context) {
      InputBorder border = OutlineInputBorder(
        borderSide: BorderSide(color: context.theme.primaryColor, strokeAlign: 5),
        borderRadius: BorderRadius.circular(6),
      );
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          validator: validator,
          autovalidateMode:autoValidateMode,
          inputFormatters: inputFormatters,
          onTap: onTap,
          obscureText: isObscure,
          readOnly: isReadOnly,
          cursorHeight: 18,
          controller: controller,
          cursorColor: context.theme.primaryColor,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: hintText,
            hintStyle: context.labelMedium.copyWith(color: Colors.grey),
            border: border,
            errorBorder: border,
            focusedBorder: border,
            focusedErrorBorder: border,
            suffixIcon: suffix,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 50.0,

            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
        ),
      );
    }
  }