
import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool _value = false;

  void _onChanged(bool? value) {
    setState(() {
      _value = value ?? false;
      widget.onChanged.call(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _value,
          activeColor: context.theme.primaryColor,
          onChanged: _onChanged,
        ),
        horizontalSpace(2),
        Text(context.locale.rememberMe),
      ],
    );
  }
}