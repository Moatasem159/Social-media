part of 'screen_body.dart';
class _DoesNotHaveAccountButton extends StatelessWidget {
  const _DoesNotHaveAccountButton();
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: context.locale.doesNotHaveAccount,
        style: context.labelMedium,
        children: [
          TextSpan(
            text: context.locale.signUp,
            style: context.labelMedium.copyWith(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => RegisterRoute().push(context),
          ),
        ],
      ),
    );
  }
}