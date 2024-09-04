part of 'screen_body.dart';
class _WelcomeDialog extends StatelessWidget {
  const _WelcomeDialog({required this.fadeAnimation,required this.offsetAnimation});
  final Animation<double> fadeAnimation;
  final Animation<Offset> offsetAnimation;
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text.rich(
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
            TextSpan(
              text: context.locale.welcomeTo,
              children: [
                TextSpan(
                  text: context.locale.socialfy,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: context.locale.welcomeDialog),
              ],
            ),
          ),
        ),
      ),
    );
  }
}