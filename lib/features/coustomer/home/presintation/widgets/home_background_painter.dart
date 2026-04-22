import 'package:flutter/material.dart';

import 'package:my_store/core/style/colors/colors_dark.dart';

class HomeBackgroundPainter extends StatelessWidget {
  const HomeBackgroundPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _HomePainter(),
        size: Size.infinite,
      ),
    );
  }
}

class _HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = ColorsDark.mainColor;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final diagonalPath = Path()
      ..moveTo(size.width * 0.08, size.height)
      ..lineTo(size.width * 0.82, size.height * 0.30)
      ..lineTo(size.width, size.height * 0.42)
      ..lineTo(size.width, size.height)
      ..close();

    final diagonalPaint = Paint()
      ..shader =
          const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF28A8E4),
              Color(0xFF4567E8),
            ],
          ).createShader(
            Rect.fromLTWH(
              size.width * 0.08,
              size.height * 0.30,
              size.width * 0.92,
              size.height * 0.70,
            ),
          );

    canvas.drawPath(diagonalPath, diagonalPaint);

    final glowPaint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              Colors.white.withOpacity(0.10),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.78, size.height * 0.78),
              radius: size.width * 0.42,
            ),
          );

    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.78),
      size.width * 0.42,
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
