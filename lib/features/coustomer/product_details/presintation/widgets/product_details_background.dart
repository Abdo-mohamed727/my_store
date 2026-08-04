import 'package:flutter/material.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class ProductDetailsBackground extends StatelessWidget {
  final Widget child;

  const ProductDetailsBackground({Key? key, required this.child})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsDark.mainColor,
        gradient: LinearGradient(
          begin: Alignment(1.0, 1.0), // Bottom Right
          end: Alignment(-1.0, -1.0), // Top Left
          stops: [0.0, 0.45, 0.45],
          colors: [
            ColorsDark.blueDark, // Dark Gold accent
            ColorsDark.blueDark,
            ColorsDark.mainColor, // Deep Navy
          ],
        ),
      ),
      child: child,
    );
  }
}
