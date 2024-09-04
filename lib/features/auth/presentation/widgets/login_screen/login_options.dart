part of 'screen_body.dart';
class _LoginOptions extends StatelessWidget {
  const _LoginOptions();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SignInButton(
          icon: AppAssets.images.icons.facebookIcon.path,
          backgroundColor: Colors.blue[700]!,
          foregroundColor: Colors.white,
          title: context.locale.signInWithFaceBook,
          onTap: () {},
        ),
        _SignInButton(
          icon: AppAssets.images.icons.googleIcon.path,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: context.locale.signInWithGoogle,
          onTap: () {},
        ),
      ],
    );
  }
}