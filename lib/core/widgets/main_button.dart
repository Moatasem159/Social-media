import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final Size? size;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final OutlinedBorder? border;
  final double ?elevation;
  const MainButton({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.size,
    this.foregroundColor,
    this.backgroundColor,
    this.border, this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: border,
        padding:
            icon == null ? null : const EdgeInsets.symmetric(horizontal: 10),
        fixedSize: size,
        elevation: elevation
      ),
      onPressed: onTap,
      child: icon == null
          ? Text(title)
          : Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(child: Text(title)),
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(icon, size: 25))
              ],
            ),
    );
  }
}