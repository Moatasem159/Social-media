part of 'screen_body.dart';
class _StartButton extends StatelessWidget {
  const _StartButton({required this.fadeAnimation, required this.offsetAnimation});
  final Animation<double> fadeAnimation;
  final Animation<Offset> offsetAnimation;
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: MainButton(
            icon: Icons.arrow_forward_rounded,
            title: context.locale.letsStart,
            onTap: () => AuthRoute().go(context),
          ),
        ),
      ),
    );
  }
}