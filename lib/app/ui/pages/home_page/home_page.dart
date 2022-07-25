import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_prueba/app/controllers/home_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/backgroud.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/widgets/boton.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/widgets/floating_buttom.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/widgets/item_container.dart';

class HomePage extends GetView<HomeController>{
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      floatingActionButton: FloatingButtom(),

      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => Stack(
            children: [
              const Backgroud(),
              controller.obx(
                (data) =>  ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemContainer(
                      opcions: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Boton(
                            callback: ()=>controller.goToTask(index), 
                            titulo_del_boton: 'ver tarea'
                          ),
                          const SizedBox(height: 20,),
                          Boton(
                            callback: (){}, 
                            titulo_del_boton: 'Editar tarea'
                          ),
                          const SizedBox(height: 20,),
                          Boton(
                            callback: ()=>controller.deleteTaksById(controller.tasks[index].id), 
                            titulo_del_boton: 'Eliminar tarea'
                          )
                        ],
                      ),
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
                onLoading: LinearProgressIndicator(),
                onError: (error) => Text(error.toString())
              ),
            ],
          )
        )
      )
    );
  }
}