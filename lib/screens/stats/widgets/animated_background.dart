import 'package:flutter/material.dart';

//? wraps AnimatedContainer, adding a touch of code to grow or shrink according to the size of its child.

class AnimatedBackground extends StatelessWidget {
  final Container child;
  const AnimatedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: child.constraints?.maxWidth,
        height: child.constraints?.maxHeight,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        child: child);
  }
}
