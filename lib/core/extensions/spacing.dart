import 'package:flutter/material.dart';

///Apply SizedBox with [height] to make  vertical white space.
SizedBox verticalSpace(double height) => SizedBox(height: height);
///Apply SizedBox with [height] to make  vertical sliver white space.
SliverToBoxAdapter verticalSliverSpace(double height) => SliverToBoxAdapter(child: SizedBox(height: height),);
///Apply SizedBox with [width] to make  horizontal white space.
SizedBox horizontalSpace(double width) => SizedBox(width: width);
///Apply SizedBox with [height] to make  horizontal sliver white space.
SliverToBoxAdapter horizontalSliverSpace(double width) =>
    SliverToBoxAdapter(child: SizedBox(width: width));