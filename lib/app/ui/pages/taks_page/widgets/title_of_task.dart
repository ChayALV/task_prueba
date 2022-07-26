import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class TitleOfTask extends StatelessWidget {
  final TaskController controller;
  const TitleOfTask({
    Key? key,required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      height: displayHeight(context)*0.45,
      decoration:BoxDecoration(
        borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            blurRadius: 10,
            offset:const Offset(0,10)
          )
        ]
      ),
      child: Stack(
        children: [
          SizedBox(
            height: displayHeight(context),
            width: displayWidth(context),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              child: Image.asset('assets/images/11408c19-5e3b-42d3-8283-b30bcbc2a17d.jpeg', fit: BoxFit.cover,)
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: SizedBox(
                  width: displayWidth(context)*0.9,
                  height: displayHeight(context)*0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        controller.task!.title,
                        style: GoogleFonts.roboto(
                          fontSize: 70,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
