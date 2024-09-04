part of 'screen_body.dart';
class _DatePickerField extends StatelessWidget {
  const _DatePickerField();
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2001),
      firstDate: DateTime(1950),
      lastDate: DateTime(2010),
    );
    if (picked != null) {
      // "${picked.day}/${picked.month}/${picked.year}"
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AuthTextFormField(
        isReadOnly: true,
        onTap: () => _selectDate(context),
        hintText: context.locale.dateOfBirth,
        textInputType: TextInputType.datetime,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}