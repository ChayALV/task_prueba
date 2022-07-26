import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/bindings/home_binding.dart';
import 'package:task_app_prueba/app/data/provider/task_provider.dart';
import 'package:task_app_prueba/app/data/provider/tasks_provider.dart';
import 'package:task_app_prueba/app/data/services/add_task.dart';
import 'package:task_app_prueba/app/data/services/delete_task_service.dart';
import 'package:task_app_prueba/app/routes/app_pages.dart';

//! De antemano gracias por la oportunidad de presentar esta prueba, espero que cumpla con sus requerimientos 
//! Para este proyecto utilice Get X como manejador de estado, la arquitectura de carpetas y archivos es la recomendada por GetX
//! Http para las peticiones a la api 
//! Recomiendo usar la extensión Better Comments para ver los comentarios de colores que coloque 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final taskAPI = Get.put( TaskApi() );
  final tasksAPI = Get.put( TasksApi() );
  final addTaskService = Get.put( AddTasksService() );
  final deleteTaskService = Get.put( DeleteTasksService() );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        initialBinding: HomeBinding(),
    );
  }
}