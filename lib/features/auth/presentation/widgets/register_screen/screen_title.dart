part of 'screen_body.dart';
class _RegisterScreenTitle extends StatelessWidget {
  const _RegisterScreenTitle();
  @override
  Widget build(BuildContext context) {
    return Text(
      context.locale.signUpToSocialfy,
      style: context.headLineSmall.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}