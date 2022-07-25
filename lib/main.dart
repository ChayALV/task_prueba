import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/bindings/home_binding.dart';
import 'package:task_app_prueba/app/data/provider/tasks_provider.dart';
import 'package:task_app_prueba/app/data/services/add_task.dart';
import 'package:task_app_prueba/app/data/services/delete_task_service.dart';
import 'package:task_app_prueba/app/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final taskAPI = Get.put( TasksApi() );
  final taskService = Get.put( TasksService() );
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