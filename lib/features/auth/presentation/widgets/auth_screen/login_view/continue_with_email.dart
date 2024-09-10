import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
class ContinueWithEmail extends StatelessWidget {
  const ContinueWithEmail({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey[500],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              context.locale.orContinueWith,
              style: context.labelSmall.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}