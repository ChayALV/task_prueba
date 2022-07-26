import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/item_container.dart';

//?Contenido de las tareas aqui caen todo el contenido que tiene la tarea 
//?Dividido en Items independientes 

class TaskContent extends StatelessWidget {
  final TaskController controller;
  const TaskContent({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemContainer(
          child: Column(
            children: [
              Text(
                'Descripción',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.indigo.shade300,
                  fontWeight: FontWeight.w900
                ),
              ),
              Text(
                controller.task!.description,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w100
                ),
              )
            ],
          ), 
        ),
        ItemContainer(
          child: Column(
            children: [
              Text(
                'Comentarios',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.indigo.shade300,
                  fontWeight: FontWeight.w900
                ),
              ),
              Text(
                controller.task!.comments,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w100
                ),
              )
            ],
          ), 
        ),
        ItemContainer(
          child: Column(
            children: [
              Text(
                '#Tags',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.indigo.shade300,
                  fontWeight: FontWeight.w900
                ),
              ),
              Text(
                controller.task!.tags,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w100
                ),
              )
            ],
          ), 
        ),
      ],
    );
  }
}

