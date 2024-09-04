import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/utils/assets.gen.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';
part 'screen_title.dart';

part 'sign_in_button.dart';

part 'or_divider.dart';

part 'does_not_have_account_button.dart';

part 'login_options.dart';

part 'forgot_password_button.dart';
part 'remember_me_button.dart';
part 'login_form.dart';
class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});
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
              verticalSpace(120),
              const _LoginScreenTitle(),
              verticalSpace(20),
              const _LoginOptions(),
              verticalSpace(15),
              const _OrDivider(),
              verticalSpace(10),
              const _LoginForm(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}