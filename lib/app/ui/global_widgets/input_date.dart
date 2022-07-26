import 'dart:ui';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class InputDate extends StatelessWidget {
  final String label;
  final TextEditingController controlador;
  const InputDate({Key? key,
    required this.label,
    required this.controlador
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                color:Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
                fontSize: 20,
              ),textAlign: TextAlign.start,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(10,10),
                  color: Colors.indigo.shade300.withOpacity(0.5)
                ),
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(-10,-10),
                  color: Colors.blue.shade50.withOpacity(0.5)
                )
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: displayWidth(context)*0.9,
                  height: displayHeight(context)*0.08,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateTimePicker(
                      controller: controlador,
                      decoration: const InputDecoration(border: InputBorder.none),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w100,
                        fontSize: 20,
                      ),textAlign: TextAlign.center,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      dateLabelText: 'Date',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


