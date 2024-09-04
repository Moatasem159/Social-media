part of 'screen_body.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthTextFormField(
          hintText: context.locale.email,
        ),
        AuthTextFormField(
          hintText: context.locale.password,
        ),
        RememberMeCheckbox(onChanged: (value) {}),
        verticalSpace(10),
        const _ForgotPasswordButton(),
        verticalSpace(20),
        const _DoesNotHaveAccountButton(),
        verticalSpace(10),
        MainButton(
          title: context.locale.signIn,
          onTap: () {},
        ),
      ],
    );
  }
}