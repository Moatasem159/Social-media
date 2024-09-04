import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';

class AuthTextFormField extends StatelessWidget {
  final String ?hintText;
  final Widget ?suffix;
  final TextEditingController ?controller;
  const AuthTextFormField({super.key, this.hintText, this.suffix, this.controller});
  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
          color: context.theme.primaryColor,
          strokeAlign: 5
      ),
      borderRadius: BorderRadius.circular(6),

    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        cursorHeight: 18,
        controller: controller,
        cursorColor: context.theme.primaryColor,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          hintText: hintText,
          hintStyle: context.labelMedium.copyWith(color: Colors.grey),
          border: border,
          errorBorder: border,
          focusedBorder:border,
          focusedErrorBorder: border,
          suffix:suffix,
          contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
        ),
      ),
    );
  }
}