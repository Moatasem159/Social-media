part of 'screen_body.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AuthTextFormField(
            hintText: context.locale.name,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          AuthTextFormField(
            hintText: context.locale.email,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          Row(
            children: [
              Expanded(
                child: AuthTextFormField(
                  hintText: context.locale.phoneNumber,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              horizontalSpace(10),
              const _DatePickerField(),
            ],
          ),
          AuthTextFormField(
            hintText: context.locale.password,
            isObscure: true,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
          ),
          AuthTextFormField(
            hintText: context.locale.confirmPassword,
            isObscure: true,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          verticalSpace(15),
          const _PasswordValidations(
            hasLowerCase: true,
            hasUpperCase: false,
            hasSpecialCharacters: false,
            hasNumber: false,
            hasMinLength: false,
          ),
          verticalSpace(15),
          MainButton(
            title: context.locale.signUp,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}