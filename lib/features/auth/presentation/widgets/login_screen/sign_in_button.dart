part of 'screen_body.dart';
class _SignInButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String title;
  final String icon;

  const _SignInButton({
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: EdgeInsets.zero,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpace(50),
          SizedBox(
            height: 34,
            width: 34,
            child: SvgPicture.asset(
              icon,
            ),
          ),
          horizontalSpace(15), // Spacing between icon and text
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}