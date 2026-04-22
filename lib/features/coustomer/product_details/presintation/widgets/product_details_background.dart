import 'package:flutter/material.dart';

class ProductDetailsBackground extends StatelessWidget {
  final Widget child;

  const ProductDetailsBackground({Key? key, required this.child})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1B1D28),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1.0), // Bottom Right
          end: Alignment(-1.0, -1.0), // Top Left
          stops: [0.0, 0.45, 0.45],
          colors: [
            Color(0xFF3B48F6), // Strong Blue
            Color(0xFF3B48F6),
            Color(0xFF1B1D28), // Dark Gray Blue
          ],
        ),
      ),
      child: child,
    );
  }
}
