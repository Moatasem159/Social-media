part of'screen_body.dart';

class _PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const _PasswordValidations({
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ValidationRow(
          text: context.locale.lowerLetter,
          hasValidated: hasLowerCase,
        ),
        verticalSpace(4),
        _ValidationRow(
          text: context.locale.upperLetter,
          hasValidated: hasUpperCase,
        ),
        verticalSpace(4),
        _ValidationRow(
          text: context.locale.specialLetter,
          hasValidated: hasSpecialCharacters,
        ),
        verticalSpace(4),
        _ValidationRow(
          text: context.locale.numberNum,
          hasValidated: hasNumber,
        ),
        verticalSpace(4),
        _ValidationRow(
          text: context.locale.numberCount,
          hasValidated: hasMinLength,
        ),
      ],
    );
  }
}

class _ValidationRow extends StatelessWidget {
  final String text;
  final bool hasValidated;

  const _ValidationRow({required this.text, required this.hasValidated});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: hasValidated? Colors.blue:Colors.grey,
        ),
        horizontalSpace(6),
        Text(text,
          style: context.labelMedium.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.blue,
            decorationThickness: 2,
            color: hasValidated ? Colors.blue : context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}