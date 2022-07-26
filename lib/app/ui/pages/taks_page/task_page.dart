import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';
import 'package:task_app_prueba/app/ui/global_widgets/backgroud.dart';
import 'package:task_app_prueba/app/ui/pages/taks_page/widgets/modal_of_update_task.dart';
import 'package:task_app_prueba/app/ui/pages/taks_page/widgets/task_content.dart';
import 'package:task_app_prueba/app/ui/pages/taks_page/widgets/title_of_task.dart';
import 'package:task_app_prueba/app/ui/pages/taks_page/widgets/vertical_calendar.dart';

class TaskPage extends GetView<TaskController> {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<TaskController>(
          builder: ((controller) => Stack(
            children: [
              const Backgroud(),
              controller.obx(
                (data) => Stack(
                  children: [
                    ListView(
                      children: [
                        Column(
                          children: [
                            FadeInDown(child: TitleOfTask(controller: controller,)),
                            FadeInLeft(child: VerticalCalendar(controller: controller,)),
                            TaskContent(controller: controller,),
                            const SizedBox(height: 90,)
                          ],
                        ),
                      ],
                    ),
                    FadeInUp(child: BottomModalOfUpdateTask(controller: controller,))
                  ],
                ),
                onLoading: const LinearProgressIndicator(),
                onError:(error) =>Text(error.toString())
              ),
            ],
          )),
        )
      )
    );
  }
}


