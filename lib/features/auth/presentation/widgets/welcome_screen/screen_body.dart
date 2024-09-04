import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
import 'package:social_media/core/extensions/spacing.dart';
import 'package:social_media/core/routing/app_router.dart';
import 'package:social_media/core/utils/assets.gen.dart';
import 'package:social_media/core/widgets/main_button.dart';
part 'background_widget.dart';
part 'background_painter.dart';
part 'screen_body_builder.dart';
part 'welcome_dialog.dart';
part 'start_button.dart';
class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _BackgroundWidget(),
        _WelcomeScreenBodyBuilder(),
      ],
    );
  }
}