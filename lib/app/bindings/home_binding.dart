import 'package:get/get.dart';
import 'package:task_app_prueba/app/controllers/home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.put(HomeController());
  }
}