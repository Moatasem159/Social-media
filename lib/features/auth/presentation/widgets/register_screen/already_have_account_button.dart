part of 'screen_body.dart';
class _AlreadyHaveAccountButton extends StatelessWidget {
  const _AlreadyHaveAccountButton();
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: context.locale.alreadyHaveAnAccount,
        style: context.labelMedium,
        children: [
          TextSpan(
            text: context.locale.signIn,
            style: context.labelMedium.copyWith(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => LoginRoute().push(context),
          ),
        ],
      ),
    );
  }
}