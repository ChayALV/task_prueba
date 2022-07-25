import 'package:get/get.dart';
import 'package:task_app_prueba/app/bindings/taks_binding.dart';
import 'package:task_app_prueba/app/ui/pages/home_page/home_page.dart';
import 'package:task_app_prueba/app/ui/pages/taks_page/task_page.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomePage(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: Routes.TASK, 
      page:()=> TaskPage(),
      transition: Transition.fadeIn,
      binding: TaskBinding()
    )
  ];
}