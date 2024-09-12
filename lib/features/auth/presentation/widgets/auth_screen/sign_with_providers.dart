import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/dependence_injection.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/assets.gen.dart';
import 'package:social_media/features/auth/presentation/cubits/sign_with_provider_cubit/sign_with_provider_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/sign_with_provider_button.dart';

class SignWithProviders extends StatelessWidget {
  const SignWithProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignWithProviderCubit>(
      create: (context) => SignWithProviderCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
      child: Builder(
        builder: (context) {
          return BlocListener<SignWithProviderCubit, SignWithProviderStates>(
            listener: context.read<SignWithProviderCubit>().mainListener,
            child: SliverToBoxAdapter(
              child: Column(
                children: [
                  BlocBuilder<SignWithProviderCubit, SignWithProviderStates>(
                    builder: (context, state) {
                      if (state is SignWithProviderLoadingState) {
                        return LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(10),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  verticalSpace(5),
                  SignWithProviderButton(
                    height: 26,
                    width: 30,
                    icon: AppAssets.images.icons.googleIcon.path,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    title: context.locale.loginWithProvider("Google"),
                    onTap: context.read<SignWithProviderCubit>().signWithGoogle,
                  ),
                  verticalSpace(8),
                  SignWithProviderButton(
                    height: 30,
                    width: 30,
                    icon: AppAssets.images.icons.icons8Facebook.path,
                    backgroundColor: const Color(0xff0866ff),
                    foregroundColor: Colors.white,
                    title: context.locale.loginWithProvider("Facebook"),
                    onTap:
                        context.read<SignWithProviderCubit>().signWithFacebook,
                  ),
                  verticalSpace(8),
                  SignWithProviderButton(
                      height: 22,
                      width: 30,
                      icon: AppAssets.images.icons.xLogo.path,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      iconColor: Colors.white,
                      title: context.locale.loginWithProvider("X"),
                      onTap: context.read<SignWithProviderCubit>().signWithTwitter),
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