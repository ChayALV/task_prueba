import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/data/models/tasks_model.dart';
import 'package:task_app_prueba/app/data/provider/tasks_provider.dart';
import 'package:task_app_prueba/app/data/services/add_task.dart';
import 'package:task_app_prueba/app/data/services/delete_task_service.dart';
import 'package:task_app_prueba/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin{

  HomeController(){
    getTask();
  }
  
  final taskAPI = Get.find<TasksApi>();
  final taskService = Get.find<AddTasksService>();
  final deleteTaskService = Get.find<DeleteTasksService>();
  
  List<Tasks> tasks = [];

  TextEditingController titulo = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController comentarios = TextEditingController();
  TextEditingController tags = TextEditingController();

  ConfettiController confetiController = ConfettiController();

  getTask() async {
    change(null, status: RxStatus.loading());
    tasks = await taskAPI.getTask();
    change(null, status: RxStatus.success());
  }

  addTask() async {
    change(null, status: RxStatus.loading());
    Map datos = {
        'titulo' : titulo.text ,
        'fecha' : fecha.text,
        'cometarios' : comentarios.text,
        'descripcion' : descripcion.text, 
        'tags' : tags.text,
    };

    await taskService.addTask(datos);

    titulo.clear();
    fecha.clear();
    descripcion.clear();
    comentarios.clear();
    tags.clear();

    getTask();
  }

  finishingTaskBy(int id) async {
    change(null, status: RxStatus.loading());

    await deleteTaskService.finishingTaskBy(id);

    getTask();
  }

  goToTask(int indexListOfTask){
    Get.toNamed(Routes.TASK, arguments: tasks[indexListOfTask].id);
  }
}