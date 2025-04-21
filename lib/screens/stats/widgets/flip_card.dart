import 'package:bloc_expenses_tracker/screens/stats/widgets/animated_background.dart';
import 'package:bloc_expenses_tracker/screens/stats/widgets/rotation_y.dart';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({super.key});

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  final Container front = Container(
    height: 200,
    width: 200,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.lightBlueAccent, width: 4),
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu_book, size: 60, color: Colors.green),
        SizedBox(height: 8),
        Text(
          'Book',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  final Container back = Container(
    height: 200,
    width: 400,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.lightBlueAccent, width: 4),
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu_book, size: 60, color: Colors.green),
        SizedBox(height: 8),
        Text(
          'Đây là một quyển sách',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

  bool _isFlipped = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          tween: Tween<double>(begin: 0, end: _isFlipped ? 180 : 0),
          builder: (context, value, child) {
            var content = value >= 90 ? back : front;

            return RotationY(
              rotationY: value,
              child: RotationY(
                rotationY: value >= 90 ? 180 : 0,
                child: Card(
                  child: AnimatedBackground(child: content),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
