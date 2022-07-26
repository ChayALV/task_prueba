import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_prueba/app/controllers/home_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/boton.dart';
import 'package:task_app_prueba/app/ui/global_widgets/item_container_animate.dart';

class ListOfTask extends StatelessWidget {
  final HomeController controller;
  const ListOfTask({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemContainerWhitAnimation(
            //?Opciones del boton
            opcions: Column(
              children: [
                const SizedBox(height: 20,),
                StylizedBottom(
                  callback: ()=>controller.goToTask(index), 
                  title_of_botton: 'ver tarea'
                ),

                const SizedBox(height: 20,),

                StylizedBottom(
                  callback: (){
                    controller.confetiController.play();
                    Timer(const Duration(milliseconds: 3000), () {
                      controller.confetiController.stop();
                      controller.finishingTaskBy(controller.tasks[index].id);
                    });
                  }, 
                  title_of_botton: 'Terminar tarea'
                )
              ],
            ),
            //?Card del la tareas
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children : [
                  Text(
                    controller.tasks[index].title,
                    maxLines: 1,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      fontSize: 40
                    ),
                    textAlign: TextAlign.start,
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          controller.tasks[index].dueDate.toString(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w100,
                              fontSize: 20
                            ),
                          ),
                          Text(
                            controller.tasks[index].id.toString(),
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w100,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                ]
              ),
            ),
          );
        },
      ),
    );
  }
}