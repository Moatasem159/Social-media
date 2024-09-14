import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/sign_with_provider_cubit/sign_with_provider_cubit.dart';

class SignInWithProviderLoading extends StatelessWidget {
  const SignInWithProviderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignWithProviderCubit, SignWithProviderStates>(
      builder: (context, state) {
        if (state is SignWithProviderLoadingState) {
          return LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
          );
        }
        return const SizedBox();
      },
    );
  }
}