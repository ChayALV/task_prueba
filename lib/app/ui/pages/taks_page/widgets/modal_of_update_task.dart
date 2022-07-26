
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/backgroud.dart';
import 'package:task_app_prueba/app/ui/global_widgets/boton.dart';
import 'package:task_app_prueba/app/ui/global_widgets/input.dart';
import 'package:task_app_prueba/app/ui/global_widgets/input_date.dart';

class BottomModalOfUpdateTask extends StatelessWidget {
  final TaskController controller;
  const BottomModalOfUpdateTask({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        StylizedBottom(callback: (){
          showCupertinoModalBottomSheet(
            context: context, builder: (BuildContext context) { 
              return Scaffold(
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      const Backgroud(),
                      //?Formulario de Actualizacion de tarea
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Edita la tarea',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 55,
                              )
                            ),
                            Column(
                              children: [
                                Input(label: 'Titulo', controlador: controller.titulo),
                                InputDate(label: 'Fecha',controlador:controller.fecha,),
                                Input(label: 'Comentarios', controlador: controller.comentarios),
                                Input(label: 'Descripcion', controlador: controller.descripcion),
                                Input(label: 'Tags', controlador: controller.tags),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            StylizedBottom(
                              callback: (){
                                controller.updateTask();
                                Navigator.pop(context);
                              }, 
                              title_of_botton: 'Editar tarea'
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
             }
          );
        }, title_of_botton: 'Editar Tarea'),
        const SizedBox(height: 20,)
      ],
    );
  }
}