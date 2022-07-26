import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleOfListTask extends StatelessWidget {
  const TitleOfListTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lista de tareas',
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 55,
      ),
      textAlign: TextAlign.center,
    );
  }
}
