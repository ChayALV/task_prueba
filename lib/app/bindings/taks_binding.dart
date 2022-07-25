import 'package:get/get.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';

class TaskBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<TaskController>(() => TaskController());
  }
}