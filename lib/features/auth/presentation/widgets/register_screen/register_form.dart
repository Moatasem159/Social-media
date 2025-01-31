part of 'screen_body.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _dateController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late AutovalidateMode _autoValidateMode;
  late DateTime dateOfBirth;
  late bool _hasLowercase;
  late bool _hasUppercase;
  late bool _hasSpecialCharacters;
  late bool _hasNumber;
  late bool _hasMinLength;
  late bool _isPasswordObscure;
  late bool _isConfirmPasswordObscure;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _dateController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordController.addListener(_passwordListener);
    _confirmPasswordController = TextEditingController();
    _autoValidateMode = AutovalidateMode.disabled;
    _hasLowercase = false;
    _hasUppercase = false;
    _hasSpecialCharacters = false;
    _hasNumber = false;
    _hasMinLength = false;
    _isPasswordObscure = true;
    _isConfirmPasswordObscure = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.removeListener(_passwordListener);
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _passwordListener() {
    setState(() {
      _hasLowercase = InputValidator.hasLowerCase(_passwordController.text);
      _hasUppercase = InputValidator.hasUpperCase(_passwordController.text);
      _hasSpecialCharacters =
          InputValidator.hasSpecialCharacter(_passwordController.text);
      _hasNumber = InputValidator.hasNumber(_passwordController.text);
      _hasMinLength = InputValidator.hasMinLength(_passwordController.text);
    });
  }

  _changePasswordObscure() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  _changeConfirmPasswordObscure() {
    setState(() {
      _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2001),
      firstDate: DateTime(1950),
      lastDate: DateTime(2010),
    );
    if (picked != null) {
      dateOfBirth = picked;
      _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  _signUp() {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    } else {
      UserCredintial user = UserCredintial(
          email: _emailController.text,
          password: _passwordController.text,
          username: _nameController.text,
          phoneNumber: _phoneNumberController.text,
          dateOfBirth: dateOfBirth);
      context.read<RegisterCubit>().emitRegisterStates(user: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      listener: context.read<RegisterCubit>().listener,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthTextFormField(
              hintText: context.locale.name,
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: _nameController,
              autoValidateMode: _autoValidateMode,
              validator: (String? name) =>
                  InputValidator.validateName(name!, context),
            ),
            AuthTextFormField(
              hintText: context.locale.email,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              controller: _emailController,
              autoValidateMode: _autoValidateMode,
              validator: (String? email) =>
                  InputValidator.validateEmail(email!, context),
            ),
            Row(
              children: [
                Expanded(
                  child: AuthTextFormField(
                    hintText: context.locale.phoneNumber,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: _phoneNumberController,
                    autoValidateMode: _autoValidateMode,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    validator: (String? phoneNumber) =>
                        InputValidator.validateEgyptianPhoneNumber(
                            phoneNumber!, context),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AuthTextFormField(
                    isReadOnly: true,
                    controller: _dateController,
                    onTap: () => _selectDate(context),
                    autoValidateMode: _autoValidateMode,
                    hintText: context.locale.dateOfBirth,
                    textInputType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    validator: (String? date) =>
                        InputValidator.validateDate(date!, context),
                  ),
                )
              ],
            ),
            AuthTextFormField(
              hintText: context.locale.password,
              isObscure: _isPasswordObscure,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              controller: _passwordController,
              autoValidateMode: _autoValidateMode,
              suffix: PasswordSuffix(
                onTap: _changePasswordObscure,
                isObscure: _isPasswordObscure,
              ),
              validator: (String? password) =>
                  InputValidator.validatePassword(password!, context),
            ),
            AuthTextFormField(
              hintText: context.locale.confirmPassword,
              isObscure: _isConfirmPasswordObscure,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: _confirmPasswordController,
              autoValidateMode: _autoValidateMode,
              suffix: PasswordSuffix(
                onTap: _changeConfirmPasswordObscure,
                isObscure: _isConfirmPasswordObscure,
              ),
              validator: (String? confirmPassword) =>
                  InputValidator.validateConfirmPassword(
                      confirmPassword!, _passwordController.text, context),
            ),
            verticalSpace(15),
            _PasswordValidations(
              hasLowerCase: _hasLowercase,
              hasUpperCase: _hasUppercase,
              hasSpecialCharacters: _hasSpecialCharacters,
              hasNumber: _hasNumber,
              hasMinLength: _hasMinLength,
            ),
            verticalSpace(15),
            BlocBuilder<RegisterCubit, RegisterStates>(
              builder: (BuildContext context, RegisterStates state) {
                if (state is RegisterLoadingState) {
                  return const CircularProgressIndicator();
                }
                return MainButton(
                  title: context.locale.signUp,
                  onTap: _signUp,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}