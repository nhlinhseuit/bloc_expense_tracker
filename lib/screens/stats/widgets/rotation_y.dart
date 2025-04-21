import 'dart:math';

import 'package:flutter/material.dart';

class RotationY extends StatelessWidget {
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationY;

  const RotationY({super.key, required this.child, this.rotationY = 0});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) //These are magic numbers, just use them :)
        ..rotateY(rotationY * degrees2Radians),
      child: child,
    );
  }
}
