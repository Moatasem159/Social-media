part of 'screen_body.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late bool _isPasswordObscure;
  late bool _rememberMe;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _isPasswordObscure = true;
    _rememberMe = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _changePasswordObscure() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  _signIn() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginWithEmailAndPasswordStates(
          email: _emailController.text,
          password: _passwordController.text,
          rememberMe: _rememberMe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: context.read<LoginCubit>().listener,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTextFormField(
              hintText: context.locale.email,
              controller: _emailController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              validator: (String? email) =>
                  InputValidator.validateEmail(email!, context),
            ),
            AuthTextFormField(
              isObscure: _isPasswordObscure,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              hintText: context.locale.password,
              controller: _passwordController,
              suffix: PasswordSuffix(
                  onTap: _changePasswordObscure, isObscure: _isPasswordObscure),
              validator: (String? password) =>
                  InputValidator.validatePassword(password!, context, true),
            ),
            RememberMeCheckbox(onChanged: (bool value) => _rememberMe = value),
            verticalSpace(10),
            const _ForgotPasswordButton(),
            verticalSpace(20),
            const _DoesNotHaveAccountButton(),
            verticalSpace(10),
            Center(
              child: BlocBuilder<LoginCubit, LoginStates>(
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  return MainButton(
                      title: context.locale.signIn, onTap: _signIn);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}