import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final Size? size;

  const MainButton(
      {super.key, required this.title, this.icon, this.onTap, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: icon == null ? null : const EdgeInsets.symmetric(horizontal: 10),
        fixedSize: size,
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