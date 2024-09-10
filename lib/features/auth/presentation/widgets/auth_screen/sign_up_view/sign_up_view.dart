import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/assets.gen.dart';
import 'package:social_media/features/auth/presentation/widgets/auth_screen/sign_with_provider_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        slivers: [
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          verticalSliverSpace(28),
          const SignUpWithProviders(),
        ],
      ),
    );
  }
}

class SignUpWithProviders extends StatelessWidget {
  const SignUpWithProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        SignWithProviderButton(
          height: 30,
          width: 30,
          icon: AppAssets.images.icons.icons8Facebook.path,
          backgroundColor: const Color(0xff0866ff),
          foregroundColor: Colors.white,
          title: context.locale.signUpWithProvider("Facebook"),
          onTap: () {},
        ),
        verticalSpace(8),
        SignWithProviderButton(
            height: 26,
            width: 30,
            icon: AppAssets.images.icons.googleIcon.path,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: context.locale.signUpWithProvider("Google"),
            onTap: () {}),
        verticalSpace(8),
        SignWithProviderButton(
            height: 22,
            width: 30,
            icon: AppAssets.images.icons.xLogo.path,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            iconColor: Colors.white,
            title: context.locale.signUpWithProvider("X"),
            onTap: () {}),
        verticalSpace(18),
      ],),
    );
  }
}