import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/extensions/spacing.dart';

class SignWithProviderButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? iconColor;
  final String title;
  final String icon;
  final double height;

  const SignWithProviderButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
    required this.icon,
    this.height = 34,
    this.iconColor,
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
            height: height,
            width: 30,
            child: SvgPicture.asset(
              icon,
              colorFilter: iconColor!=null?ColorFilter.mode(iconColor!, BlendMode.srcIn):null,
            ),
          ),
          horizontalSpace(15), // Spacing between icon and text
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}