import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
part 'screen_title.dart';
class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(120),
          const _RegisterScreenTitle(),
          verticalSpace(20),
        ],
      ),
    );
  }
}