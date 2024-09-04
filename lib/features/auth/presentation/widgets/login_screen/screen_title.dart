part of 'screen_body.dart';
class _LoginScreenTitle extends StatelessWidget {
  const _LoginScreenTitle();
  @override
  Widget build(BuildContext context) {
    return Text(
      context.locale.signInToSocialfy,
      style: context.headLineSmall.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}