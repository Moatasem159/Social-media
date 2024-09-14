import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/core/di/dependence_injection.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/assets.gen.dart';
import 'package:social_media/core/widgets/snack_bar.dart';
import 'package:social_media/features/auth/data/models/sign_in_method.dart';
import 'package:social_media/features/auth/presentation/cubits/sign_with_provider_cubit/sign_with_provider_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/complete_data_bottom_sheet.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/sign_in_with_provider_loading.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/sign_with_provider_button.dart';

class SignWithProviders extends StatelessWidget {
  const SignWithProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignWithProviderCubit>(
      create: (context) => SignWithProviderCubit(getIt(), getIt()),
      child: Builder(
        builder: (context) {
          return BlocListener<SignWithProviderCubit, SignWithProviderStates>(
            listener: (context, state) {
              if (state is SignWithProviderSuccessState && !state.userCredential.additionalUserInfo!.isNewUser) {
                //TODO:navigate to home;
              }
              if (state is SignWithProviderSuccessState && state.userCredential.additionalUserInfo!.isNewUser) {
                showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  isScrollControlled: true,
                  builder: (_) {
                    return BlocProvider<SignWithProviderCubit>.value(
                      value: context.read<SignWithProviderCubit>(),
                      child: CompleteDateBottomSheet(uId: state.userCredential.user!.uid),
                    );
                  },
                );
              }
              if (state is SignWithProviderErrorState) {
                context.showSnackBar(snackBar(state.error.message.getErrorMessage(context)));
              }
            },
            child: SliverToBoxAdapter(
              child: Column(
                children: [
                  const SignInWithProviderLoading(),
                  verticalSpace(5),
                  SignWithProviderButton(
                    height: 26,
                    icon: AppAssets.images.icons.googleIcon.path,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    title: context.locale.loginWithProvider("Google"),
                    onTap: () => context
                        .read<SignWithProviderCubit>()
                        .signWithProvider(SignInWithGoogle()),
                  ),
                  verticalSpace(8),
                  SignWithProviderButton(
                    height: 30,
                    icon: AppAssets.images.icons.icons8Facebook.path,
                    backgroundColor: const Color(0xff0866ff),
                    foregroundColor: Colors.white,
                    title: context.locale.loginWithProvider("Facebook"),
                    onTap: () => context
                        .read<SignWithProviderCubit>()
                        .signWithProvider(SignInWithFacebook()),
                  ),
                  verticalSpace(8),
                  SignWithProviderButton(
                    height: 22,
                    icon: AppAssets.images.icons.xLogo.path,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    iconColor: Colors.white,
                    title: context.locale.loginWithProvider("X"),
                    onTap: () => context
                        .read<SignWithProviderCubit>()
                        .signWithProvider(SignInWithTwitter()),
                  ),
                  verticalSpace(18),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}