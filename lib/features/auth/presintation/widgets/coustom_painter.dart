import 'package:flutter/material.dart';

class AuthCustomPainter extends CustomPainter {
  AuthCustomPainter({required this.gradient, super.repaint});
  final LinearGradient gradient;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    // Layer 1
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromPoints(Offset.zero, Offset(0, size.height)),
      );

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0345067, size.height * 0.6583005);
    path_0.lineTo(size.width * 1.0372800, size.height * 1.0012192);
    path_0.lineTo(size.width * 1.0394667, size.height * 1.0054064);
    path_0.lineTo(size.width * -0.0378133, size.height * 0.9998645);

    canvas.drawPath(path_0, paint);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
