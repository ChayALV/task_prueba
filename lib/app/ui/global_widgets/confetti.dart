import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confeti extends StatelessWidget {
  final ConfettiController controllerConfeti;
  const Confeti({
    Key? key, required this.controllerConfeti,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: controllerConfeti,
      blastDirectionality: BlastDirectionality.explosive,
      numberOfParticles: 30,
      emissionFrequency: 0.30,
      minBlastForce: 10,
      maxBlastForce: 100,
    );
  }
}