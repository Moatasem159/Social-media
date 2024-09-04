part of 'screen_body.dart';
class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(context.screenWidth,context.screenHeight),
      painter: _BackgroundPainter(context: context),
    );
  }
}