import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CoustomFadeInDown extends StatelessWidget {
  const CoustomFadeInDown({
    required this.child,

    required this.duration,
    super.key,
  });
  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CoustomFadeInUp extends StatelessWidget {
  const CoustomFadeInUp({
    required this.child,
    required this.duration,
    super.key,
  });
  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CoustomFadeInLeft extends StatelessWidget {
  const CoustomFadeInLeft({
    required this.child,

    required this.duration,
    super.key,
  });
  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CoustomFadeInRight extends StatelessWidget {
  const CoustomFadeInRight({
    required this.child,

    required this.duration,
    super.key,
  });
  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}
