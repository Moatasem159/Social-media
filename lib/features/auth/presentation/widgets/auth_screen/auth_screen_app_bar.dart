import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/utils/assets.gen.dart';

class AuthScreenAppBar extends StatelessWidget {
  const AuthScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        pinned: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.images.socialfyIcon.image(
                width: 50,
                height: 50,
                color: context.isDark ? Colors.white : Colors.black),
            horizontalSpace(5),
            Text(
              context.locale.socialfy,
              style: context.headLineSmall,
            ),
          ],
        ),
        toolbarHeight: 55,
        bottom: TabBar(
          tabs: [
            Text(context.locale.loginWithProvider("login")),
            Text(context.locale.signUpWithProvider("signUp")),
          ],
        ),
      ),
    );
  }
}