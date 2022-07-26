import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/controllers/home_controller.dart';
import 'package:task_app_prueba/app/data/models/task_model.dart';
import 'package:task_app_prueba/app/data/provider/task_provider.dart';
import 'package:task_app_prueba/app/data/services/update_task_service.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class TaskController extends GetxController with StateMixin {
  TaskController(){
    getTask();
  }

  final taskAPI = Get.find<TaskApi>();
  final updateTaskService = Get.put(UpdateTasksService());
  final homeController = Get.find<HomeController>();

  Task? task;

  TextEditingController titulo = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController comentarios = TextEditingController();
  TextEditingController tags = TextEditingController();

  setVaulesFromInputs(){

      titulo = TextEditingController.fromValue(TextEditingValue(text:task!.title));
      fecha = TextEditingController.fromValue(TextEditingValue(text:task!.dueDate == '0000-00-00' ? fechaActual.toString() : task!.dueDate));
      descripcion = TextEditingController.fromValue(TextEditingValue(text:task!.description));
      comentarios = TextEditingController.fromValue(TextEditingValue(text:task!.comments));
      tags = TextEditingController.fromValue(TextEditingValue(text:task!.tags));

  }

  getTask() async {

    task = await taskAPI.getTaskById(Get.arguments ?? task!.id);
    change(null, status: RxStatus.success());
    setVaulesFromInputs();

  }

  updateTask() async {

    change(null, status: RxStatus.loading());

    Map datos = {
        'id'          : task!.id,
        'titulo'      : titulo.text ,
        'fecha'       : fecha.text,
        'cometarios'  : comentarios.text,
        'descripcion' : descripcion.text, 
        'tags'        : tags.text,
    };
    
    await updateTaskService.updateTask(datos);

    homeController.getTask();

    getTask();
    
  }
}