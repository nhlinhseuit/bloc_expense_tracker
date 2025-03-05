import 'package:bloc_expenses_tracker/widgets/gradient_card.dart';
import 'package:flutter/material.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [GradientCard(), GradientCard()],
    );
  }
}
