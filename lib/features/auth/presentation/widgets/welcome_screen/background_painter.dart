part of 'screen_body.dart';
class _BackgroundPainter extends CustomPainter {
  final BuildContext context;
  const _BackgroundPainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = context.isDark ? Colors.white : Colors.black;
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5029722, size.height * -0.0005128);
    path_0.cubicTo(
        size.width * 0.4986111,
        size.height * 0.1241026,
        size.width * 0.5999722,
        size.height * 0.2554872,
        size.width * 1.0029722,
        size.height * 0.2564103);
    path_0.quadraticBezierTo(size.width * 1.0029722, size.height * 0.1926282,
        size.width * 1.0040833, size.height * -0.0002564);
    path_0.quadraticBezierTo(size.width * 0.8779722, size.height * 0.0004487,
        size.width * 0.5029722, size.height * -0.0005128);
    path_0.close();
    canvas.drawPath(path_0, paintFill0);
    Paint paintFill1 = Paint()
      ..color = context.isDark ? Colors.white : Colors.black;
    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0027778, size.height * 0.9988846);
    path_1.quadraticBezierTo(size.width * -0.0015278, size.height * 0.7775385,
        size.width * -0.0011111, size.height * 0.7037564);
    path_1.cubicTo(
        size.width * 0.3678333,
        size.height * 0.7049359,
        size.width * 0.5004444,
        size.height * 0.8462051,
        size.width * 0.5022222,
        size.height * 0.9978590);
    path_1.quadraticBezierTo(size.width * 0.3759722, size.height * 0.9981154,
        size.width * -0.0027778, size.height * 0.9988846);
    path_1.close();
    canvas.drawPath(path_1, paintFill1);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}