import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/input_validation.dart';
import 'package:social_media/core/widgets/main_button.dart';
import 'package:social_media/core/widgets/snack_bar.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/presentation/cubits/sign_with_provider_cubit/sign_with_provider_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_text_form_field.dart';

class CompleteDateBottomSheet extends StatefulWidget {
  final String uId;

  const CompleteDateBottomSheet({super.key, required this.uId});

  @override
  State<CompleteDateBottomSheet> createState() =>
      _CompleteDateBottomSheetState();
}

class _CompleteDateBottomSheetState extends State<CompleteDateBottomSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late AutovalidateMode _autoValidateMode;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _autoValidateMode = AutovalidateMode.disabled;
    _formKey = GlobalKey<FormState>();
  }

  @override
  dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      UserData user = UserData(
        uId: widget.uId,
        username: _nameController.text,
        phoneNumber: _phoneController.text,
      );
      context.read<SignWithProviderCubit>().setUserData(user);
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignWithProviderCubit, SignWithProviderStates>(
      listener: (context, state) {
        if (state is SetUserDataSuccessState) {
          context.pop();
          //TODO:navigate to home
        }
        if (state is SetUserDataErrorState) {
          context.showSnackBar(snackBar(state.error.message.getErrorMessage(context)));
        }
      },
      child: PopScope(
        canPop: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.viewInsetsOf(context).bottom + 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(16),
                Container(
                  width: 35,
                  height: 3,
                  decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                verticalSpace(16),
                Text(context.locale.completeYourData),
                verticalSpace(16),
                AuthTextFormField(
                  prefix: Icons.account_circle_outlined,
                  autoValidateMode: _autoValidateMode,
                  controller: _nameController,
                  validator: (String? name) =>
                      InputValidator.validateName(name!, context),
                  hintText: context.locale.enterYourName,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpace(16),
                AuthTextFormField(
                  prefix: Icons.phone,
                  autoValidateMode: _autoValidateMode,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11)
                  ],
                  controller: _phoneController,
                  validator: (String? phone) =>
                      InputValidator.validateEgyptianPhoneNumber(
                          phone!, context),
                  hintText: context.locale.enterYourPhoneNumber,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
                verticalSpace(16),
                BlocBuilder<SignWithProviderCubit, SignWithProviderStates>(
                  builder: (context, state) {
                    if (state is SetUserDataLoadingState) {
                      return const CircularProgressIndicator(
                        strokeWidth: 1,
                      );
                    }
                    return MainButton(
                      title: context.locale.submit,
                      onTap: _submitData, // Submit action
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}