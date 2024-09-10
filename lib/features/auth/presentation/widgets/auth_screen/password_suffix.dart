import 'package:flutter/material.dart';

class PasswordSuffix extends StatelessWidget {
  final VoidCallback onTap;
  final bool isObscure;
  const PasswordSuffix({super.key,required this.onTap,required this.isObscure});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        !isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      ),
    );
  }
}