import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:task_app_prueba/app/controllers/home_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/backgroud.dart';
import 'package:task_app_prueba/app/ui/global_widgets/boton.dart';
import 'package:task_app_prueba/app/ui/global_widgets/input.dart';
import 'package:task_app_prueba/app/ui/global_widgets/input_date.dart';

class BottomOfCreateTask extends StatelessWidget {
  BottomOfCreateTask({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor:Colors.blue.shade50,
        onPressed:(){
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                  const Backgroud(),
                  //? formulario de nueva tarea
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Agrega una nueva tarea',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 55,
                          )
                        ),
                        Column(
                          children: [
                            Input(label: 'Titulo', controlador: homeController.titulo),
                            InputDate(label: 'Fecha',controlador:homeController.fecha,),
                            Input(label: 'Comentarios', controlador: homeController.comentarios),
                            Input(label: 'Descripcion', controlador: homeController.descripcion),
                            Input(label: 'Tags', controlador: homeController.tags),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        StylizedBottom(
                          callback: (){
                            homeController.addTask();
                            Navigator.pop(context);
                          }, 
                          title_of_botton: 'Agregar tarea'
                        ),
                      ],
                    ),
                  )
                  ],
                ),
              ),
            )
          );
        },
        child: Icon(FontAwesomeIcons.pen,color:Colors.indigo.shade300 ,),
      );
  }
}