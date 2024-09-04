part of 'screen_body.dart';
class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text(
          context.locale.forgotPassword,
          style: context.labelSmall.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}