import 'package:flutter/material.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class Backgroud extends StatelessWidget {
  const Backgroud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      height: displayHeight(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade50,
            Colors.indigo.shade300
          ]
        )
      ),
    );
  }
}