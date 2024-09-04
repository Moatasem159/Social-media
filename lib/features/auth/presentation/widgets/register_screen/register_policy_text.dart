part of 'screen_body.dart';
class _RegisterPolicyText extends StatelessWidget {
  const _RegisterPolicyText();
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: context.locale.registerPolicyText,
        style: context.labelMedium.copyWith(fontSize: 14, height: 1.6),
        children: [
          TextSpan(
            text: context.locale.termsOfService,
            style: context.labelMedium.copyWith(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(text: context.locale.and),
          TextSpan(
            text: context.locale.privacyPolicy,
            style: context.labelMedium.copyWith(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}