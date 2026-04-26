import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class ProfileBackgroundLayer extends StatelessWidget {
  const ProfileBackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(color: ColorsDark.mainColor),
          Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: .72,
              heightFactor: .92,
              child: ClipPath(
                clipper: _DiagonalClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ColorsDark.blueLight, ColorsDark.blueDark],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 0,
            child: Container(height: 120.h, color: ColorsDark.navBarDark),
          ),
        ],
      ),
    );
  }
}

class _DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width * .62, 0)
      ..lineTo(size.width, size.height * .12)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
