import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/controllers/home_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/backgroud.dart';
import 'package:task_app_prueba/app/ui/global_widgets/confetti.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/widgets/bottom_of_create_task.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/widgets/list_of_task.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/widgets/tittle_of_list_task.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      floatingActionButton: BottomOfCreateTask(),

      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              const Backgroud(),
              controller.obx(
                (data) =>  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInDown(child: const TitleOfListTask()),
                    ListOfTask(controller: controller,)
                  ],
                ),
                //Barra de carga
                onLoading: const LinearProgressIndicator(),
                //Widget de muesta de error
                onError: (error) => Text(error.toString())
              ),
              Confeti(controllerConfeti: controller.confetiController, )
            ],
          )
        )
      )
    );
  }
}

